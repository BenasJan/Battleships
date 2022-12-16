using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public sealed class BattleshipShipMover : BaseShipMover
{
    protected override int GetMovementSize(PlayerShip ship)
    {
        return 2;
    }
}