using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Builders;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Models;
using Battleships.Facades;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class GameSessionService : IGameSessionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly ICurrentUserService _currentUserService;

        public GameSessionService(
            IBattleshipsDatabase battleshipsDatabase,
            ICurrentUserService userService
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = userService;
        }

        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            return await new GameSessionFacade(_battleshipsDatabase, _currentUserService, dto).CreateGameSession();
        }

        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _battleshipsDatabase.GameSessionsRepository.GetAll();
            return models.Select(x => x.toDto()).ToList();
        }
        
        public async Task<GameSessionDto> GetSession(Guid id)
        {
            return (await _battleshipsDatabase.GameSessionsRepository.GetWithPlayers(id)).toDto();
        }

        public async Task<InGameSessionDto> GetInGameSession(Guid gameSessionId)
        {
            var dto = new InGameSessionDto();
            var userId = _currentUserService.GetCurrentUserId();
            
            var (ownPlayerId, opponentPlayerId) = await _battleshipsDatabase.GameSessionsRepository.GetPlayerIds(gameSessionId, userId);
            var ownTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(ownPlayerId);
            var opponentTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(opponentPlayerId);

            var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);

            dto.ColumnCount = session.Settings.ColumnCount;
            dto.RowCount = session.Settings.RowCount;

            dto.OwnTiles = GetTileDtos(ownTiles, dto.ColumnCount, dto.RowCount);
            dto.OpponentTiles = GetTileDtos(opponentTiles, dto.ColumnCount, dto.RowCount);
        }

        private List<GameTile> GetTileDtos(List<ShipTile> shipTiles, int columnCount, int rowCount)
        {
            var tiles = Enumerable.Range(1, columnCount).SelectMany(columnCoordinate =>
            {
                return Enumerable.Range(1, rowCount).Select(rowCoordinate =>
                {
                    var shipTile = shipTiles.FirstOrDefault(st =>
                        st.XCoordinate == columnCoordinate && st.YCoordinate == rowCoordinate
                    );

                    var tile = new GameTile
                    {
                        ColumnCoordinate = columnCoordinate,
                        RowCoordinate = rowCoordinate,
                        IsShip = shipTile is not null,
                        IsDestroyed = shipTile is not null
                            ? shipTile.IsDestroyed
                            : false
                    };

                    return tile;
                });
            });

            return tiles.ToList();

        }
    }
}