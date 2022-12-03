using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
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
            var session = await _battleshipsDatabase.GameSessionsRepository.GetWithPlayersAndSettings(attack.GameSessionId);
            var attackedTiles = await _battleshipsDatabase.ShipTilesRepository.GetAttackedTiles(attack);
            var currentUserPlayer = session.Players.First(p => p.IsCurrentPlayerTurn);
            var opponentPlayer = session.Players.First(p => !p.IsCurrentPlayerTurn);

            if (attackedTiles.Any())
            {
                attackedTiles.ForEach(t => t.IsDestroyed = true);
                await _battleshipsDatabase.ShipTilesRepository.UpdateMany(attackedTiles);
            }
            else
            {
                var tile = new ShipTile
                {
                    IsDestroyed = true,
                    XCoordinate = attack.TargetXCoordinate,
                    YCoordinate = attack.TargetYCoordinate,
                    AttackerPlayerId = currentUserPlayer.Id,
                    TargetPlayerId = opponentPlayer.Id
                };
                await _battleshipsDatabase.ShipTilesRepository.Create(tile);
            }
            
            session.CurrentRound += 1;
            currentUserPlayer.IsCurrentPlayerTurn = false;
            opponentPlayer.IsCurrentPlayerTurn = true;
            
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