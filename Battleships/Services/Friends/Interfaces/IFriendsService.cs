using Battleships.Data.Dto;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Battleships.Services.Friends.Interfaces
{
    public interface IFriendsService
    {
        Task<List<FriendDto>> ListFriends();

        Task<bool> AddFriend(string userId);
        Task<bool> RemoveFriend(FriendDto friend);

    }
}
