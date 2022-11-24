using System.Collections.Generic;
using System;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Battleships.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Battleships.Data.Dto;

namespace Battleships.Services.Users
{
    public class UserManager : IUserManager
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public UserManager(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        public IQueryable<ApplicationUser> Users => _userManager.Users;

        public async Task<ApplicationUser> GetById(string userId)
        {
            return await _userManager.FindByIdAsync(userId);
        }

        public IQueryable<ApplicationUser> GetWhere(Expression<Func<ApplicationUser, bool>> filter)
        {
            return _userManager.Users.Where(filter).AsQueryable();
        }

        public async Task<List<UserDto>> GetOtherUsers(string currentUserId) 
        {
            var users = Users.Where(u => u.Id != currentUserId)
                .Select(u => new UserDto
                {
                    Id = u.Id,
                    Name = u.UserName,
                    GamesPlayedCount = u.Players.Count,
                    GamesWonCount = u.WonGames.Count
                }).ToListAsync();

            return await users;
        }
    }
}