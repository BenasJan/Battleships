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

        public GameSessionService(IBattleshipsDatabase database, ICurrentUserService userService)
        {
            _database = database;
            _currentUserService = userService;
        }
        
        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            var model = new Models.GameSession(dto.Icon, dto.Name, new GameSessionSettings());
            
            var player = new Player(model, true, _currentUserService.GetCurrentUserId());
            await _database.PlayersRepository.Create(player);
            model.Players.Add(player);
            var guid = await _database.GameSessionsRepository.Create(model);
            player.GameSessionId = guid;
            await _database.PlayersRepository.Update(player);

            var deleteThis = _database.GameSessionsRepository.GetById(guid);
            Console.WriteLine(deleteThis.ToString());

            return guid;
        }
        
        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var test = new List<GameSessionDto>();
            var session = new GameSessionDto();
            session.Id = Guid.Parse("43021935-1114-4edd-85b5-a8c5e2e36885");
            session.Icon = "ikona";
            session.Name = "Bobs And Vegana";
            session.HostName = "hosto neimas";
            session.GridSize = "5x5";
            session.SettingsString = "Settingu stringas";
            session.HostId = Guid.Parse("43021925-1434-4edd-85b5-a8c5e2e36885");
            test.Add(session);
            
            var session2 = new GameSessionDto();
            session.Id = Guid.Parse("43021935-1114-4edd-85b5-a8c5e2e36885");
            session2.Icon = "ikona2";
            session2.Name = "HA HA Benis";
            session2.HostName = "hosto neimas222";
            session2.GridSize = "5x52";
            session2.SettingsString = "Settingu stringas2";
            session.HostId = Guid.Parse("43021925-1434-4edd-85b5-a8c5e2e36825");
            test.Add(session2);
            
            return test;
            // var models = await _database.GameSessionsRepository.GetAll();
            // return models.Select(x => x.toDto()).ToList();
        }
    }
}