 using System;
using System.Collections.Generic;
using Battleships.Data.Dto;
using System.Collections.Generic;

namespace Battleships.Models
{
    public class GameSession : BaseModel
    {
        public string Icon { get; set; }
        public string Name { get; set; }
        public List<Player> Players { get; set; }
        public GameSessionSettings Settings { get; set; }
        
        public GameSessionDto toDto()
        {
            var dto = new GameSessionDto();
            dto.Id = this.Id;
            // if (Players is not null)
            // {
            Console.WriteLine("Players:");
            foreach(var player in Players)
            {
                Console.WriteLine(player.IsHost);
            }
            dto.HostId = this.Players[0].Id;
            dto.HostName = this.Players[0].User.Name;
            // }
            // else
            // {
            //     dto.HostId = Guid.Parse("43021935-1114-4edd-85b5-a8c5e2e36885");
            //     dto.HostName = "naem";
            // }

            dto.Icon = this.Icon;
            dto.Name = this.Name;
            dto.GridSize = this.Settings.GridSize;
            dto.GameType = this.Settings.GameType;
            // dto.SettingsString = "Settingu stringas";
            return dto;
        }

        public GameSession()
        {
            
        }

        public override string ToString()
        {
            return this.Id.ToString() + " " + this.Name + " " +this.Icon;
        }
    }
}