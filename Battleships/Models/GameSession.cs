using System;
using System.Collections.Generic;
using Battleships.Data.Dto;

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
            dto.Icon = this.Icon;
            dto.Name = this.Name;
            dto.GridSize = "5x5";
            dto.SettingsString = "Settingu stringas";
            return dto;
        }

        public GameSession()
        {
            
        }
        
        public GameSession(string icon, string name, GameSessionSettings settings)
        {
            Icon = icon;
            Name = name;
            Settings = settings;
        }

        public override string ToString()
        {
            return this.Id.ToString() + " " + this.Name + " " +this.Icon;
        }
    }
}