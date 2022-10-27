using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Players.Interfaces;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Battleships.Services.Players
{
    public class PlayersService : IPlayersService
    {
        private readonly IBattleshipsDatabase _db;

        private readonly UserManager<ApplicationUser> _userManager;

        public PlayersService (IBattleshipsDatabase database, UserManager<ApplicationUser> userManager)
        {
            _db = database;
            _userManager = userManager;
        }        

        public async Task<List<PlayerDto>> ListPlayers()
        {
            Random random = new Random();

            var allUsers = _userManager.Users.ToList();

            var test = new List<PlayerDto>();

            foreach ( var user in allUsers )
            {
                var player = new PlayerDto()
                {
                    Name = user.UserName,
                    GamesPlayedCount = random.Next(25,50),
                    GamesWonCount = random.Next(0, 25)
                };

                test.Add(player);
            }

            return test;
        }

        public async Task<List<PlayerLobbyDto>> ListPlayersToLobby()
        {
            var allUsers = (await _db.PlayersRepository.GetAll()).Select(x => x.ToLobbyDto()).ToList();
            return allUsers;
        }

        public async Task InviteUserToGame(Guid gameSessionId, string userId)
        {
            var player = new Player
            {
                GameSessionId = gameSessionId,
                UserId = userId
            };

            await _db.PlayersRepository.Create(player);
        }
    }
}
