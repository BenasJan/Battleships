using System;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class AttackExecutionProxy : IAttackExecutor
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IAttackExecutor _attackExecutor;

    public AttackExecutionProxy(
        IBattleshipsDatabase battleshipsDatabase,
        IAttackExecutor attackExecutor
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _attackExecutor = attackExecutor;
    }
    
    public async Task ExecuteAttack(AttackPayload attack)
    {
        Console.WriteLine("EXECUTING ATTACK WITH PROXY");
        
        var player = (await _battleshipsDatabase.PlayersRepository.GetWhere(p =>
            p.GameSessionId == attack.GameSessionId && p.UserId == attack.AttackingUserId)).FirstOrDefault();

        var userHasAccessToGame = player is not null;
        
        if (userHasAccessToGame)
        {
            await _attackExecutor.ExecuteAttack(attack);
        }
    }
}