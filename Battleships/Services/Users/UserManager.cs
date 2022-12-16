using System.Collections.Generic;
using System;
using System.Linq;
using System.Linq.Expressions;

using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Services.Users;

public class UserManager : IUserManager
{
    private readonly UserManager<ApplicationUser> _userManager;
    IQueryable<ApplicationUser> IUserManager.Users => _userManager.Users;


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
        var users = await Users.Where(u => u.Id != currentUserId)
            .Select(u => new UserDto
            {
                Id = u.Id,
                Name = u.UserName,
                GamesPlayedCount = u.Players.Count,
                GamesWonCount = u.WonGames.Count,
                IsFriend = u.FriendsIAmAddedBy.Any(f => f.InitiatingUserId == currentUserId)
            }).ToListAsync();

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

    public async Task<List<ApplicationUser>> GetFriendsList(string currentUserId, List<string> friendsIds) // used specifically for friends service
    {
        return await _userManager.Users
                .Where(user => friendsIds.Contains(user.Id))
                .ToListAsync();
    }
}