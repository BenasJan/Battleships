using System;
using Battleships.Models.enums;

namespace Battleships.Models
{
    public class GameSessionSettings : BaseModel
    {
        public Guid GameSessionId { get; set; }
        public string GridSize { get; set; }
        public int ColumnCount { get; set; }
        public int RowCount { get; set; }
        public GameTypes GameType { get; set; }
        public int RoundCountLimitForEndgame { get; set; }
        public int DestroyedShipsPercentageForEndgame { get; set; }
        public int DestroyedShipCountForEndgame { get; set; }
        
        public GameSession GameSession { get; set; }
    }
}