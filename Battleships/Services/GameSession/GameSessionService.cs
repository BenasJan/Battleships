using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Builders;
using Battleships.Data.Dto;
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

        public GameSessionService(IBattleshipsDatabase battleshipsDatabase, ICurrentUserService userService)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = userService;
        }
        
        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            var userId = _currentUserService.GetCurrentUserId();
            
            var gameSettings = new GameSessionSettings
            {
                GridSize = dto.SettingsDto.GridSize,
                GameType = dto.SettingsDto.GameType
            };
            var players = new List<Player>
            {
                new Player
                {
                    IsHost = true,
                    UserId = userId
                }
            };
            var gameSession = new GameSessionBuilder()
                .WithIcon(dto.Icon)
                .WithName(dto.Name)
                .WithDateCreated(DateTime.Now)
                .WithSessionSettings(gameSettings)
                .WithPlayers(players)
                .Build();
            
            var id = await _battleshipsDatabase.GameSessionsRepository.Create(gameSession);
            
            return id;
        }

        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _battleshipsDatabase.GameSessionsRepository.GetAll();
            return models.Select(x => x.toDto()).ToList();
        }
    }
}