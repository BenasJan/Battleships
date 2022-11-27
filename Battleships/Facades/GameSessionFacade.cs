using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Builders;

namespace Battleships.Facades
{
    public class GameSessionFacade : IGameSessionFacade
    {
        private readonly IBattleshipsDatabase _database;
        private readonly ICurrentUserService _currentUserService;
        private readonly GameSessionRequestDto _dto;

        public GameSessionFacade(IBattleshipsDatabase database, ICurrentUserService currentUserService, GameSessionRequestDto dto)
        {
            _database = database;
            _currentUserService = currentUserService;
            this._dto = dto;
        }

        public async Task<Guid> CreateGameSession()
        {
            var userId = _currentUserService.GetCurrentUserId();
            
            var gameSettings = new GameSessionSettings
            {
                ColumnCount = _dto.SettingsDto.ColumnCount,
                RowCount = _dto.SettingsDto.RowCount,
                GameType = _dto.SettingsDto.GameType
            };
            var players = new List<Player>
            {
                new Player
                {
                    IsHost = true,
                    UserId = userId,
                    IsCurrentPlayerTurn = true
                }
            };

            IGameSessionBuilder builder = new GameSessionBuilder();
            
            var gameSession = builder
                .WithIcon(_dto.Icon)
                .WithName(_dto.Name)
                .WithDateCreated(DateTime.UtcNow)
                .WithSessionSettings(gameSettings)
                .WithPlayers(players)
                .WithStatus(GameSessionStatus.Created)
                .Build();
            
            var id = await _database.GameSessionsRepository.Create(gameSession);
            
            return id;
        }
    }
}