using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Events;

namespace Battleships.Services.Friends.Interfaces
{
    public interface IFriendsService
    {
        Task<List<FriendDto>> ListFriends();
        Task<bool> AddFriend(AddFriendEvent addFriendEvent);
        Task<bool> RemoveFriend(RemoveFriendEvent removeFriend);
    }
}
