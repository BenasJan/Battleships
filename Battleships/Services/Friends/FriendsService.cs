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

        public async Task<List<FriendDto>> ListFriends()
        {
            var currentUserId = _currentUserService.GetCurrentUserId();

            var friends = await _userManager.Users
                .Where(user => user.Id == currentUserId)
                .SelectMany(
                    user => user.AddedFriends.Select(friend => new FriendDto 
                    { 
                        Name = friend.AddedUser.Name,
                        GamesPlayedCount = friend.AddedUser.Players.Count,
                        GamesWonCount = friend.AddedUser.WonGames.Count,
                        FriendId = friend.Id,
                        UserId = user.Id 
                    }))
                .ToListAsync();

            return friends;
        }

        public async Task<List<string>> GetFriendsIds(string currentUserId)
        {
            var friends = await _db.FriendsRepository.GetWhere(
                user => user.InitiatingUserId.ToString() == currentUserId || user.AddedUserId.ToString() == currentUserId);

            var friendsIds = new List<string>();

            foreach (var friend in friends.Where(friend => friend.InitiatingUserId.ToString() == currentUserId || friend.AddedUserId.ToString() == currentUserId))
            {
                if (friend.InitiatingUserId.ToString() == currentUserId)
                {
                    friendsIds.Add(friend.AddedUserId.ToString());
                }
                else if (friend.AddedUserId.ToString() == currentUserId)
                {
                    friendsIds.Add(friend.InitiatingUserId.ToString());
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
                    InitiatingUserId = Guid.Parse(currentUserId),
                    AddedUserId = Guid.Parse(userId)
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
