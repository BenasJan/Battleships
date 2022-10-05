using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Data.Dto;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class GameSessionService : IGameSessionService
    {
        private readonly IBattleshipsDatabase _database;
        private readonly ICurrentUserService _currentUserService;
        private readonly IGameSessionRepository _gameSessionRepository;

        public GameSessionService(IBattleshipsDatabase database, ICurrentUserService userService, IGameSessionRepository gameSessionRepository)
        {
            _database = database;
            _currentUserService = userService;
            _gameSessionRepository = gameSessionRepository;
        }
        
        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            var userId = _currentUserService.GetCurrentUserId();
            
            var gameSettings = new GameSessionSettings
            {
                GridSize = dto.SettingsDto.GridSize,
                GameType = dto.SettingsDto.GameType
            };
            var gameSession = new Models.GameSession()
            {
                Icon = dto.Icon,
                Name = dto.Name,
                Settings = gameSettings,
                Players = new List<Player>
                {
                    new Player
                    {
                        IsHost = true,
                        UserId = userId,
                    }
                }
            };

            var id = await _database.GameSessionsRepository.Create(gameSession);
            
            return id;
        }
        
        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _gameSessionRepository.GetAll();
            return models.Select(x => x.toDto()).ToList();
        }
    }
}