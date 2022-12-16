using System.Linq;
using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public sealed class SubmarineShipMover : BaseShipMover
{
    protected override int GetMovementSize(PlayerShip ship)
    {
        return 5;
    }

    protected override bool IsShipMovable(PlayerShip ship)
    {
        var isOutOfBounds = ship.Tiles.Any(tile => tile.XCoordinate > 10 || tile.YCoordinate > 10);

        return !isOutOfBounds;
    }
}