using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Players.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Battleships.Services.Users;

namespace Battleships.Services.Players
{
    public class PlayersService : IPlayersService
    {
        private readonly IBattleshipsDatabase _db;
        private readonly IUserManager _userManager;
        private readonly ICurrentUserService _currentUserService;

        public PlayersService(
            IBattleshipsDatabase database,
            IUserManager userManager,
            ICurrentUserService currentUserService)
        {
            _db = database;
            _userManager = userManager;
            _currentUserService = currentUserService;
        }

        public async Task<List<UserDto>> GetAllUsers()
        {
            var currentUserId = _currentUserService.GetCurrentUserId();

            var users = await _userManager.GetOtherUsers(currentUserId);

            return users;
        }

        public async Task<List<UserDto>> GetLobbyUsers(Guid gameSessionId)
        {
            var users = await _userManager.GetLobbyUsers(gameSessionId);

            return users;
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