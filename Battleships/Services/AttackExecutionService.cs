using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;

namespace Battleships.Services
{
    public class AttackExecutionService : IAttackExecutionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly IEndgameService _endgameService;
        private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;

        public AttackExecutionService(
            IBattleshipsDatabase battleshipsDatabase,
            IEndgameService endgameService,
            IBattleshipsSynchronizationService battleshipsSynchronizationService)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _endgameService = endgameService;
            _battleshipsSynchronizationService = battleshipsSynchronizationService;
        }

        public async Task ExecuteAttack(AttackPayload attack)
        {
            var session = await _battleshipsDatabase.GameSessionsRepository.GetById(attack.GameSessionId);
            var destroyedTile = await _battleshipsDatabase.ShipTilesRepository.GetAttackedTile(attack);

            if (destroyedTile is not null)
            {
                destroyedTile.IsDestroyed = true;
                await _battleshipsDatabase.ShipTilesRepository.Update(destroyedTile);
            }
            
            session.CurrentRound += 1;
            await _battleshipsDatabase.GameSessionsRepository.Update(session);
            await _battleshipsSynchronizationService.SendAttackMessage(session.Id, new BattleshipsMessage<AttackPayload>
            {
                CallerUserId = attack.AttackingUserId,
                Payload = attack
            });
            
            if (await _endgameService.IsEndgameReached(attack.GameSessionId))
            {
                await _endgameService.EndGameSession(attack.GameSessionId, attack.AttackingUserId);
            }
        }
    }
}