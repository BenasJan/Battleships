using System;
using System.Collections.Generic;
using Battleships.Models;
using Battleships.Models.enums;

namespace Battleships.Data.Dto
{
    public class GameSessionDto
    {
        public Guid Id { get; set; }
        public string Icon { get; set; }
        public string Name { get; set; }
        public string GridSize { get; set; }
        //public string SettingsString { get; set; }
        public GameTypes GameType { get; set; }
        public string HostName { get; set; }
        public Guid HostId { get; set; }
        public List<PlayerLobbyDto> Players { get; set; }

        public override string ToString()
        {
            foreach (var x in Players)
            {
                Console.WriteLine(x.Name);
            }
            return $"{nameof(Id)}: {Id}, {nameof(Icon)}: {Icon}, {nameof(Name)}: {Name}, {nameof(GridSize)}: {GridSize}, {nameof(GameType)}: {GameType}, {nameof(HostName)}: {HostName}, {nameof(HostId)}: {HostId}, {nameof(Players)}: {Players.ToString()}";
        }
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