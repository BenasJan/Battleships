using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;

namespace Battleships.Services.Friends.Interfaces
{
    public interface IFriendsService
    {
        Task<List<FriendDto>> ListFriends();

        Task<bool> AddFriend(string userId);
        Task<bool> RemoveFriend(FriendDto friend);

    }
}
