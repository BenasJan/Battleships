using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class GameSessionControl : IGameSessionControl
{
    private readonly IAttackExecutionService _attackExecutionService;
    private readonly IShipMovingService _shipMovingService;

    public GameSessionControl(
        IAttackExecutionService attackExecutionService,
        IShipMovingService shipMovingService
    )
    {
        _attackExecutionService = attackExecutionService;
        _shipMovingService = shipMovingService;
    }

    public async Task ExecuteAttack(AttackEvent attackEvent)
    {
        await _attackExecutionService.ExecuteAttack(attackEvent);
    }

    public async Task MoveShip(MoveShipEvent moveShipEvent)
    {
        await _shipMovingService.MoveShip(moveShipEvent);
    }
}