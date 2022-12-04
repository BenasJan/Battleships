using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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

        public async Task<List<RemoveFriendEvent>> ListFriends()
        {
            var currentUserId = _currentUserService.GetCurrentUserId();
            var friendsIds = await GetFriendsIds(currentUserId);
            var friendsUsers = await _userManager.GetFriendsList(currentUserId, friendsIds);

            var friends = friendsUsers.Select(user => new RemoveFriendEvent
            {
                // Name = user.UserName,
                // GamesPlayedCount = RandomNumberGenerator.GetInt32(25, 50),
                // GamesWonCount = RandomNumberGenerator.GetInt32(25),
                // UserId = user.Id
            }).ToList();

            return friends;
        }

        public async Task<List<string>> GetFriendsIds(string currentUserId)
        {
            var friends = await _db.FriendsRepository.GetWhere(
                user => user.User1.ToString() == currentUserId || user.User2.ToString() == currentUserId);

            var friendsIds = new List<string>();

            foreach (var friend in friends.Where(friend => friend.User1.ToString() == currentUserId || friend.User2.ToString() == currentUserId))
            {
                if (friend.User1.ToString() == currentUserId)
                {
                    friendsIds.Add(friend.User2.ToString());
                }
                else if (friend.User2.ToString() == currentUserId)
                {
                    friendsIds.Add(friend.User1.ToString());
                }
            }

            return friendsIds;
        }

        public async Task<bool> AddFriend(AddFriendEvent addFriendEvent)
        {
            var currentUserId = addFriendEvent.InitiatorUserId;
            var userId = addFriendEvent.TargetUserId;
            var friendsIds = GetFriendsIds(currentUserId).Result;

            if (userId != null && userId != currentUserId && !friendsIds.Contains(userId.ToString()))
            {
                var newFriend = new Friend()
                {
                    User1 = Guid.Parse(currentUserId),
                    User2 = Guid.Parse(userId)
                };
                await _db.FriendsRepository.Create(newFriend);

                return true;
            }

            return  false;
        }

        public async Task<bool> RemoveFriend(RemoveFriendEvent removeFriend)
        {
            var friend = await _db.FriendsRepository.GetById(removeFriend.FriendId);
            await _db.FriendsRepository.Delete(friend);

            return true;
        }
    }
}
