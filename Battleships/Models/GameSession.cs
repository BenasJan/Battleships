 using System;
using System.Collections.Generic;
using Battleships.Data.Dto;
using System.Collections.Generic;
 using System.IO;
 using System.Linq;
 using System.Runtime.Serialization.Formatters.Binary;
 using Battleships.Models.enums;
 using Battleships.Prototype;

 namespace Battleships.Models
{
    public class GameSession : GameSessionPrototype
    {
        public string Icon { get; set; }
        public string Name { get; set; }
        public DateTime DateCreated { get; set; }
        public TimeSpan GameLength { get; set; }
        public GameSessionStatus Status { get; set; }
        public int CurrentRound { get; set; } = 1;
        public string EndgameStrategy { get; set; }
        public List<Player> Players { get; set; }
        public GameSessionSettings Settings { get; set; }

        public string WinnerId { get; set; }
        public ApplicationUser Winner { get; set; }
        
        public GameSessionDto toDto()
        {

            var dto = new GameSessionDto();
            dto.Id = this.Id;
            dto.HostId = this.Players[0].Id;
            dto.HostName = this.Players[0].User.Name;
            dto.Icon = this.Icon;
            dto.Name = this.Name;
            dto.GridSize = this.Settings.GridSize;
            dto.GameType = this.Settings.GameType;
            var players = this.Players.Select(player => player.ToLobbyDto()).ToList();
            dto.LobbyPlayers = players;
            
            return dto;
        }

        public GameSession()
        {
            
        }

        public override string ToString()
        {
            return this.Id.ToString() + " " + this.Name + " " + this.Icon + " " + this.Players[0].Id;
        }

        public override GameSessionPrototype ShallowClone()
        {
            return this.MemberwiseClone() as GameSessionPrototype;
        }

        public override GameSessionPrototype DeepClone(GameSession gameSessionPrototype)
        {
            using (MemoryStream stream = new())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(stream, gameSessionPrototype);
                stream.Position = 0;
                return (GameSessionPrototype)formatter.Deserialize(stream);
            }
        }
    }
}