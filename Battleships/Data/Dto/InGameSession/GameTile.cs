using System;

namespace Battleships.Data.Dto.InGameSession;

public class GameTile
{
    public bool IsShip { get; set; }
    public bool IsDestroyed { get; set; }
    public int ColumnCoordinate { get; set; }
    public int RowCoordinate { get; set; }

    public Guid? ShipId { get; set; }
    public string SkinName { get; set; }
}