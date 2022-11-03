using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using Battleships.Commands;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Facades;
using Battleships.Models;
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
            return await _battleshipsDatabase.GameSessionsRepository.GetWithPlayers(id);
        }

        public async Task<InGameSessionDto> GetInGameSession(Guid gameSessionId)
        {
            var userId = _currentUserService.GetCurrentUserId();
            
            var (ownPlayerId, opponentPlayerId) = await _battleshipsDatabase.GameSessionsRepository.GetPlayerIds(gameSessionId, userId);
            var ownTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(ownPlayerId);
            var opponentTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(opponentPlayerId);

            var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);

            var dto = new InGameSessionDto
            {
                GameSessionId = gameSessionId,
                ColumnCount = session.Settings.ColumnCount,
                RowCount = session.Settings.RowCount,
                OwnTiles = GetTileDtos(ownTiles, session.Settings.ColumnCount, session.Settings.RowCount),
                OpponentTiles = GetTileDtos(opponentTiles, session.Settings.ColumnCount, session.Settings.RowCount)
            };
            
            return dto;
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
                            : false,
                        ShipId = shipTile != null ? shipTile.PlayerShipId : null
                    };

                    return tile;
                });
            });

            return tiles.ToList();

        }

        public async Task<InGameSessionDto> MoveShipInSession (Guid gameSessionId, Guid shipId, string direction)
        {
            PlayerShip playerShip = await _battleshipsDatabase.PlayerShipsRepository.GetById(shipId);

            if (/*direction == "Up"*/true)
            {
                IShipActionCommand shipMoveUpCommand = new ShipMoveUpCommand(playerShip);
                shipMoveUpCommand.Execute();
            }

            var gameSessionDto = await this.GetInGameSession(gameSessionId);
            return gameSessionDto;
        }
    }
}