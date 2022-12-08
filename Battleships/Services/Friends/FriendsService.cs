using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Friends.Interfaces;
using Battleships.Services.Users;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Services.Friends
{
    public class FriendsService : IFriendsService
    {
        private readonly IBattleshipsDatabase _db;
        private readonly IUserManager _userManager;
        private readonly ICurrentUserService _currentUserService;
        
        public FriendsService (IBattleshipsDatabase database, IUserManager userManager, ICurrentUserService currentUserService)
        {
            _db = database;
            _userManager = userManager;
            _currentUserService = currentUserService;
        }        

        public async Task<List<FriendDto>> ListFriends()
        {
            var currentUserId = _currentUserService.GetCurrentUserId();

            var friends = await _userManager.Users
                .Where(user => user.Id == currentUserId)
                .SelectMany(
                    user => user.Friends.Select(friend => new FriendDto 
                    { 
                        Name = friend.TargetUser.Name,
                        GamesPlayedCount = friend.TargetUser.Players.Count,
                        GamesWonCount = friend.TargetUser.WonGames.Count,
                        FriendId = friend.Id,
                        UserId = user.Id 
                    }))
                .ToListAsync();

            return friends;
        }

        public async Task<bool> AddFriend(AddFriendEvent addFriendEvent)
        {
            var currentUserId = addFriendEvent.InitiatorUserId;
            var userId = addFriendEvent.TargetUserId;

            var existingFriend = (await _db.FriendsRepository
                .GetWhere(friend => friend.InitiatingUserId == currentUserId && friend.TargetUserId == userId)).SingleOrDefault();

            if (existingFriend is not null)
            {
                return false;
            }

            var friend = new Friend
            {
                InitiatingUserId = currentUserId,
                TargetUserId = userId
            };

            await _db.FriendsRepository.Create(friend);

            return true;
        }

        public async Task<bool> RemoveFriend(RemoveFriendEvent removeFriend)
        {
            var friend = await _db.FriendsRepository.GetById(removeFriend.FriendId);
            await _db.FriendsRepository.Delete(friend);

            return true;
        }
    }
}
