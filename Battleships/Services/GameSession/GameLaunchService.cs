using System;
using System.Threading.Tasks;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class GameLaunchService : IGameLaunchService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly IPlayerShipGenerationService _playerShipGenerationService;

        public GameLaunchService(
            IBattleshipsDatabase battleshipsDatabase,
            IPlayerShipGenerationService playerShipGenerationService)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _playerShipGenerationService = playerShipGenerationService;
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
        }

        private async Task LaunchRematch(Guid gameSessionId)
        {
            var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetWithPlayersAndSettings(gameSessionId);
            var deepCopy = gameSession.DeepClone(gameSession) as Models.GameSession;

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

