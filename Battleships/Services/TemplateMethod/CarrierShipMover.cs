using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public sealed class CarrierShipMover : BaseShipMover
{
    protected override int GetMovementSize(PlayerShip ship)
    {
        return 1;
    }
}