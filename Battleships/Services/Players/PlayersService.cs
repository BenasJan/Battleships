﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Players.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Battleships.Services.Players
{
    public class PlayersService : IPlayersService
    {
        private readonly IBattleshipsDatabase _db;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ICurrentUserService _currentUserService;

        public PlayersService(
            IBattleshipsDatabase database,
            UserManager<ApplicationUser> userManager,
            ICurrentUserService currentUserService)
        {
            _db = database;
            _userManager = userManager;
            _currentUserService = currentUserService;
        }

        public async Task<List<UserDto>> GetAllUsers()
        {
            var currentUserId = _currentUserService.GetCurrentUserId();

            var users = await _userManager.Users
                .Where(u => u.Id != currentUserId)
                .Select(u => new UserDto
                {
                    Id = u.Id,
                    Name = u.UserName,
                    GamesPlayedCount = u.Players.Count,
                    GamesWonCount = u.WonGames.Count
                })
                .ToListAsync();

            return users;
        }

        public async Task<List<UserDto>> GetLobbyUsers(Guid gameSessionId)
        {
            var users = await _userManager.Users
                .Where(u => u.Players.All(p => p.GameSessionId != gameSessionId))
                .Select(u => new UserDto
                {
                    Id = u.Id,
                    Name = u.UserName,
                    GamesPlayedCount = u.Players.Count,
                    GamesWonCount = u.WonGames.Count
                })
                .ToListAsync();
            
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
