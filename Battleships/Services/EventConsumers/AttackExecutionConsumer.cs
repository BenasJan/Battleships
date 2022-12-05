using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services.EventConsumers;

public class AttackExecutionConsumer : BaseConsumer<AttackEvent>
{
    private readonly IAttackExecutor _attackExecutor;

    public AttackExecutionConsumer(IAttackExecutor attackExecutor)
    {
        _attackExecutor = attackExecutor;
    }

    protected override async Task HandleEvent(AttackEvent @event)
    {
        await _attackExecutor.ExecuteAttack(@event);
    }
}