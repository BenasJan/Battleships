using System;
using System.Collections.Generic;

namespace Battleships.Data.Dto.InGameSession;

public class InGameSessionDto
{
    public Guid GameSessionId { get; set; }
    public int ColumnCount { get; set; }
    public int RowCount { get; set; }

    public List<GameTile> OwnTiles { get; set; }
    public List<GameTile> OpponentTiles { get; set; }
}