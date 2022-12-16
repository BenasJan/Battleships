using System;
using System.Threading;
using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class AttackExecutionProxyDelayed : IAttackExecutor
{
    private readonly IAttackExecutor _attackExecutor;

    public AttackExecutionProxyDelayed(IAttackExecutor attackExecutor)
    {
        _attackExecutor = attackExecutor;
    }

    public async Task ExecuteAttack(AttackEvent attack)
    {
        Console.WriteLine($"{nameof(AttackExecutionProxyDelayed)} HAS BEEN CALLED");
        Thread.Sleep(TimeSpan.FromSeconds(2));
        await _attackExecutor.ExecuteAttack(attack);
    }
}