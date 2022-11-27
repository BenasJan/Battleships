using System;
using System.Collections.Generic;
using Battleships.Models.enums;

namespace Battleships.Data.Dto
{
    public class GameSessionDto
    {
        public Guid Id { get; set; }
        public string Icon { get; set; }
        public string Name { get; set; }
        public string GridSize { get; set; }
        public GameTypes GameType { get; set; }
        public string HostName { get; set; }
        public Guid HostId { get; set; }
        public List<PlayerLobbyDto> LobbyPlayers { get; set; }

        public override string ToString()
        {
            foreach (var x in LobbyPlayers)
            {
                Console.WriteLine(x.Name);
            }
            return $"{nameof(Id)}: {Id}, {nameof(Icon)}: {Icon}, {nameof(Name)}: {Name}, {nameof(GridSize)}: {GridSize}, {nameof(GameType)}: {GameType}, {nameof(HostName)}: {HostName}, {nameof(HostId)}: {HostId}, {nameof(LobbyPlayers)}: {LobbyPlayers.ToString()}";
        }
    }
}