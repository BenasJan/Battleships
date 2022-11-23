using System;
using System.Threading.Tasks;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.Users;
using Battleships.SignalR.Interfaces;

namespace Battleships.Services
{
    public class EndgameService : IEndgameService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly IEndgameStrategyService _endgameStrategyService;
        private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;
        private readonly IUserManager _userManager;

        public EndgameService(
            IBattleshipsDatabase battleshipsDatabase,
            IEndgameStrategyService endgameStrategyService,
            IBattleshipsSynchronizationService battleshipsSynchronizationService,
            IUserManager userManager)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _endgameStrategyService = endgameStrategyService;
            _battleshipsSynchronizationService = battleshipsSynchronizationService;
            _userManager = userManager;
        }

        public async Task<bool> IsEndgameReached(Guid gameSessionId)
        {
            var strategy = await _endgameStrategyService.GetEndgameStrategy(gameSessionId);

            return await strategy.IsEndgameReached(gameSessionId);
        }

        public async Task EndGameSession(Guid gameSessionId, string attackerId)
        {
            var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);
        
            session.WinnerId = attackerId;
            session.Status = GameSessionStatus.EndgameReached;

            await _battleshipsDatabase.GameSessionsRepository.Update(session);

            var winnerName = (await _userManager.GetById(attackerId)).UserName;
            await _battleshipsSynchronizationService.SendEndgameReached(gameSessionId, winnerName);
        }
    }
}