using System;
using System.Collections.Generic;

namespace Battleships.Models
{
    public class Player : BaseModel
    {
        public Guid GameSessionId { get; set; }
        public GameSession GameSession { get; set; }
        public bool IsHost { get; set; }
        
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }

        public List<PlayerShip> PlayerShips { get; set; }

        public Player()
        {
            
        }
        public Player(GameSession gameSession, bool isHost, string userId)
        {
            GameSession = gameSession;
            IsHost = isHost;
            UserId = userId;
        }
    }
}