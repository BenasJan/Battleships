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
    
    public async Task ExecuteAttack(AttackEvent attack)
    {
        var player = (await _battleshipsDatabase.PlayersRepository
            .GetWhere(p => 
                p.GameSessionId == attack.GameSessionId &&
                p.UserId == attack.InitiatorUserId &&
                p.IsCurrentPlayerTurn)
            ).FirstOrDefault();

        var playerExistsWithTurn = player is not null;
        
        if (playerExistsWithTurn)
        {
            await _attackExecutor.ExecuteAttack(attack);
        }
        else
        {
            throw new Exception($"{attack.InitiatorUserId} cannot attack in game session {attack.GameSessionId}");
        }
    }
}