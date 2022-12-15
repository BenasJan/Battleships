using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services.EventConsumers;

public class AttackExecutionConsumer : BaseConsumer<AttackEvent>
{
    private readonly IAttackExecutionService _attackExecutionService;

    public AttackExecutionConsumer(IAttackExecutionService attackExecutionService)
    {
        _attackExecutionService = attackExecutionService;
    }

    protected override async Task HandleEvent(AttackEvent @event)
    {
        await _attackExecutionService.ExecuteAttack(@event);
    }
}