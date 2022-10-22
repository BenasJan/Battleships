using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.SignalR.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Services
{
    public class AttackExecutionService : IAttackExecutionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly IEndgameService _endgameService;

        public AttackExecutionService(
            IBattleshipsDatabase battleshipsDatabase,
            IEndgameService endgameService
            )
        {
            _battleshipsDatabase = battleshipsDatabase;
            _endgameService = endgameService;
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
            
            await _endgameService.RefreshEndgame(attack.GameSessionId, attack.AttackingUserId);
        }
    }
}