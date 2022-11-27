using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

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

        public async Task<List<ApplicationUser>> GetFriendsList(string currentUserId, List<string> friendsIds) // used specifically for friends service
        {
            return await _userManager.Users
                    .Where(user => friendsIds.Contains(user.Id))
                    .ToListAsync();
        }
    }
}