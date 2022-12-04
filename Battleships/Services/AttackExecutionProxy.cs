using System.Linq;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class AttackExecutionProxy : IAttackExecutionService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IAttackExecutionService _attackExecutionService;

    public AttackExecutionProxy(
        IBattleshipsDatabase battleshipsDatabase,
        IAttackExecutionService attackExecutionService
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _attackExecutionService = attackExecutionService;
    }
    
    public async Task ExecuteAttack(AttackPayload attack)
    {
        var player = (await _battleshipsDatabase.PlayersRepository.GetWhere(p =>
            p.GameSessionId == attack.GameSessionId && p.UserId == attack.AttackingUserId)).FirstOrDefault();

        var userHasAccessToGame = player is not null;
        
        if (userHasAccessToGame)
        {
            await _attackExecutionService.ExecuteAttack(attack);
        }
    }
}