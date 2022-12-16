using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public sealed class CruiserShipMover : BaseShipMover
{
    protected override int GetMovementSize(PlayerShip ship)
    {
        return 2;
    }
}