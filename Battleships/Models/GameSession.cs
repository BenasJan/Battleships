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
        public DateTime DateCreated { get; set; }
        public TimeSpan GameLength { get; set; }
        public bool IsOver { get; set; }
        public int CurrentRound { get; set; } = 1;
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
            // dto.SettingsString = "Settingu stringas";
            return dto;
        }

        public GameSession()
        {
            
        }

        public override string ToString()
        {
            return this.Id.ToString() + " " + this.Name + " " + this.Icon;
        }
    }
}