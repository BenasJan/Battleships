using System;
using System.Threading.Tasks;
using Battleships.Data.Events;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.EventConsumers;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class GameLaunchService : IGameLaunchService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly IPlayerShipGenerationService _playerShipGenerationService;
        private readonly ICurrentUserService _currentUserService;
        private readonly IEventsMediator _eventsMediator;

        public GameLaunchService(
            IBattleshipsDatabase battleshipsDatabase,
            IPlayerShipGenerationService playerShipGenerationService,
            ICurrentUserService currentUserService,
            IEventsMediator eventsMediator)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _playerShipGenerationService = playerShipGenerationService;
            _currentUserService = currentUserService;
            _eventsMediator = eventsMediator;
        }

        public async Task LaunchGame(Guid gameSessionId, bool rematch)
        {
            if (rematch)
            {
                await LaunchRematch(gameSessionId);
            }
            else
            {
                await LaunchGame(gameSessionId);
            }
        }
        
        public async Task LaunchGame(Guid gameSessionId)
        {
            var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);
            var playerShips = await _playerShipGenerationService.GeneratePlayerShips(gameSession.Settings);

            gameSession.Status = GameSessionStatus.InProgress;

            await _battleshipsDatabase.PlayerShipsRepository.CreateMany(playerShips);
            await _battleshipsDatabase.GameSessionsRepository.Update(gameSession);
            
            var gameLaunchEvent = new GameLaunchedEvent(_currentUserService.GetCurrentUserId(), gameSessionId);
            await _eventsMediator.PublishEvent(gameLaunchEvent);
        }

        private async Task LaunchRematch(Guid gameSessionId)
        {
            var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetWithPlayersAndSettings(gameSessionId);
            var deepCopy = gameSession.DeepCopy(gameSession);

            var playerShips = await _playerShipGenerationService.GeneratePlayerShips(gameSession.Settings);

            if (deepCopy != null)
            {
                deepCopy.Status = GameSessionStatus.InProgress;

                await _battleshipsDatabase.PlayerShipsRepository.CreateMany(playerShips);
                await _battleshipsDatabase.GameSessionsRepository.Update(deepCopy);
            }
        }
    }
}

