using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Facades;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace Battleships.Services.GameSession
{
    public class GameSessionService : IGameSessionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly ICurrentUserService _currentUserService;
        private readonly UserManager<ApplicationUser> _userManager;

        public GameSessionService(
            IBattleshipsDatabase battleshipsDatabase,
            ICurrentUserService userService,
            UserManager<ApplicationUser> userManager
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = userService;
            _userManager = userManager;
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

        public async Task<PlayerLobbyDto> AddPlayerToSession(PlayerLobbyDtoWithSessionId playerLobbyDto)
        {
            var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetWithPlayers(playerLobbyDto.SessionId);
                
            if(gameSession is null)
                throw new ArgumentNullException("GameSessionService.AddPlayerToSession() gameSession is null");
            
            var player = null as Player;
            foreach (var user in _userManager.Users)
                if (user.Id == playerLobbyDto.Id)
                    player = new Player
                    {
                        IsHost = false,
                        UserId = playerLobbyDto.Id
                    };

            gameSession.Players.Add(player);
            await _battleshipsDatabase.GameSessionsRepository.Update(gameSession);
            return new PlayerLobbyDto {Id = playerLobbyDto.Id, Name = playerLobbyDto.Name};
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
                            : false
                    };

                    return tile;
                });
            });

            return tiles.ToList();

        }
    }
}