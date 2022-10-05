using System.Linq;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Services
{
    public class AttackExecutionService : IAttackExecutionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;

        public AttackExecutionService(
            IBattleshipsDatabase battleshipsDatabase
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
        }

        public async Task ExecuteAttack(AttackPayload attack)
        {
            var destroyedTile = (await _battleshipsDatabase.ShipTilesRepository.GetWhere(tile =>
                tile.XCoordinate == attack.TargetXCoordinate && tile.YCoordinate == attack.TargetYCoordinate &&
                tile.PlayerShip.Player.UserId != attack.AttackingUserId &&
                tile.PlayerShip.Player.GameSessionId == attack.GameSessionId
            )).SingleOrDefault();

            if (destroyedTile is not null)
            {
                destroyedTile.IsDestroyed = true;
                await _battleshipsDatabase.ShipTilesRepository.Update(destroyedTile);
            }
        }
    }
}