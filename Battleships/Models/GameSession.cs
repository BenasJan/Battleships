 using System;
 using System.Collections.Generic;
 using System.Linq;
 using Battleships.Data.Dto;
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
        
        public GameSessionDto ToDto()
        {

            var dto = new GameSessionDto();
            dto.Id = this.Id;
            dto.HostId = this.Players[0].Id;
            dto.HostName = this.Players[0].Id.ToString();
            dto.Icon = this.Icon;
            dto.Name = this.Name;
            dto.GridSize = this.Settings.GridSize;
            dto.GameType = this.Settings.GameType;
            var players = this.Players.Select(player => player.ToLobbyDto()).ToList();
            dto.LobbyPlayers = players;
            
            return dto;
        }

        private GameSession DeepCopy(GameSession gameSession)
        {
            var shallowCopy = ShallowClone() as GameSession;
            var settings = shallowCopy.Settings;

            var playerOne = new Player(gameSession, true, gameSession.Players[0].UserId);
            var playerTwo = new Player(gameSession, false, gameSession.Players[1].UserId);
            var players = new List<Player>{ playerOne , playerTwo};

            var session = new GameSession
            {
                Icon = gameSession.Icon,
                Name = gameSession.Name,
                DateCreated = gameSession.DateCreated,
                GameLength = gameSession.GameLength,
                Status = gameSession.Status,
                CurrentRound = gameSession.CurrentRound,
                EndgameStrategy = gameSession.EndgameStrategy,
                Players = players,
                Settings = settings,
            };

            return session;
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
            var copiedSession = DeepCopy(gameSessionPrototype);
            return copiedSession;
        }
    }
}