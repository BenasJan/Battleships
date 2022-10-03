using System;
using Battleships.Models;

namespace Battleships.Data.Dto
{
    public class GameSessionDto
    {
        public Guid Id { get; set; }
        public string Icon { get; set; }
        public string Name { get; set; }
        public string GridSize { get; set; }
        public string SettingsString { get; set; }
        public string HostName { get; set; }
        public Guid HostId { get; set; }
        
        // public GameSession toModel()
        // {
        //     var model = new GameSession();
        //     model.Id = this.Id;
        //     model.Icon = this.Icon;
        //     model.Name = this.Name;
        //     
        //     model.Host = this.HostName;
        //     model.GridSize = "5x5";
        //     model.SettingsString = "Settingu stringas";
        //     return dto;
        // }
    }
}