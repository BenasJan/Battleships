using System;
using System.Collections.Generic;
using System.Linq;
using Battleships.Models;

namespace Battleships.Services.TemplateMethod;

public abstract class BaseShipMover
{
    public PlayerShip MoveShip(PlayerShip ship, Direction direction, int columnCount, int rowCount)
    {
        if (IsShipMovable(ship))
        {
            return ship;
        }

        var movementSize = GetMovementSize(ship);

        if (IsMovementAllowedWithinGrid(ship, direction, movementSize, columnCount, rowCount))
        {
            ship.Tiles = MoveTiles(ship.Tiles, direction, movementSize);
        }
        else
        {
            throw new InvalidOperationException("Cannot move ship");
        }

        return ship;
    }

    private List<ShipTile> MoveTiles(List<ShipTile> tiles, Direction direction, int movementSize)
    {
        switch (direction)
        {
            case Direction.Undefined:
                throw new ArgumentOutOfRangeException(nameof(direction), direction, null);
            case Direction.Up:
                tiles.ForEach(tile => tile.YCoordinate -= movementSize);
                break;
            case Direction.Down:
                tiles.ForEach(tile => tile.YCoordinate += movementSize);
                break;
            case Direction.Left:
                tiles.ForEach(tile => tile.XCoordinate -= movementSize);
                break;
            case Direction.Right:
                tiles.ForEach(tile => tile.XCoordinate += movementSize);
                break;
            default:
                throw new ArgumentOutOfRangeException(nameof(direction), direction, null);
        };

        return tiles;
    }
    
    protected virtual bool IsShipMovable(PlayerShip ship)
    {
        return ship.Tiles.Count >= 4 || ship.Tiles.Any(tile => tile.IsDestroyed);
    }
    
    protected abstract int GetMovementSize(PlayerShip ship);

    private bool IsMovementAllowedWithinGrid(PlayerShip ship, Direction direction, int movementSize, int columnCount, int rowCount)
    {
        var isGridViolated = ship.Tiles.Any(tile =>
        {
            return direction switch
            {
                Direction.Undefined => throw new ArgumentOutOfRangeException(nameof(direction), direction, null),
                Direction.Up => tile.YCoordinate - movementSize < 0,
                Direction.Down => tile.YCoordinate + movementSize > rowCount,
                Direction.Left => tile.XCoordinate - movementSize < 0,
                Direction.Right => tile.XCoordinate + movementSize > columnCount,
                _ => throw new ArgumentOutOfRangeException(nameof(direction), direction, null)
            };
        });
        
        return !isGridViolated;
    }
}