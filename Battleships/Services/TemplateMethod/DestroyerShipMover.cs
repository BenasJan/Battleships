using System.Linq;
using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public sealed class DestroyerShipMover : BaseShipMover
{
    protected override int GetMovementSize(PlayerShip ship)
    {
        return 3;
    }

    protected override bool IsShipNotMovable(PlayerShip ship)
    {
        var isShipWithinUnmovableTerritory = ship.Tiles.Any(tile => tile.YCoordinate < 4 || tile.XCoordinate < 4);
        
        return !isShipWithinUnmovableTerritory;
    }
}