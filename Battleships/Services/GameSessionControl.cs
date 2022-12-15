using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class GameSessionControl : IGameSessionControl
{
    private readonly IAttackExecutionService _attackExecutionService;

    public GameSessionControl(IAttackExecutionService attackExecutionService)
    {
        _attackExecutionService = attackExecutionService;
    }

    public async Task ExecuteAttack(AttackEvent attackEvent)
    {
        await _attackExecutionService.ExecuteAttack(attackEvent);
    }

    public async Task MoveShip(MoveShipEvent moveShipEvent)
    {
        throw new System.NotImplementedException();
    }
}