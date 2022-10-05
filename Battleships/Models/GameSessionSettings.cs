using System;
using Battleships.Models.enums;

namespace Battleships.Models
{
    public class GameSessionSettings : BaseModel
    {
        public Guid GameSessionId { get; set; }
        public string GridSize { get; set; }
        public GameTypes GameType { get; set; }
        public int RoundCount { get; set; }
        public int DestroyedShipPercentage { get; set; }
        public GameSession GameSession { get; set; }
    }
}