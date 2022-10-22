using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Builders;
using Battleships.Models;
using Battleships.Data.Dto;
using Battleships.Facades;
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

        public GameSessionService(IBattleshipsDatabase database, ICurrentUserService userService,
            IGameSessionRepository gameSessionRepository)
        {
            _database = database;
            _currentUserService = userService;
            _gameSessionRepository = gameSessionRepository;
        }
        
        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            return await new GameSessionFacade(_database, _currentUserService, dto).CreateGameSession();
        }
        
        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _gameSessionRepository.GetAll();
            return models.Select(x => x.toDto()).ToList();
        }
        
        public async Task<GameSessionDto> GetSession(Guid id)
        {
            return (await _gameSessionRepository.GetById(id)).toDto();
        }
    }
}