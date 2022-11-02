using System;
using System.Collections.Generic;
using Battleships.Data.Dto;

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

        public PlayerLobbyDto ToLobbyDto()
        {
            var dto = new PlayerLobbyDto();
            dto.Id = Guid.NewGuid();
            dto.Name = this.User.Name;
            
            return dto;
        }
        
        public override string ToString()
        {
            return $"{nameof(GameSessionId)}: {GameSessionId}, {nameof(GameSession)}: {GameSession}, {nameof(IsHost)}: {IsHost}, {nameof(UserId)}: {UserId}, {nameof(User)}: {User.ToString()}, {nameof(PlayerShips)}: {PlayerShips}";
        }
    }
}