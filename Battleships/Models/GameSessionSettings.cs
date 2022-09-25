using System;

namespace Battleships.Models
{
    public class GameSessionSettings : BaseModel
    {
        public Guid GameSessionId { get; set; }
        public GameSession GameSession { get; set; }
    }
}