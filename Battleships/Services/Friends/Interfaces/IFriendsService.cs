using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;

namespace Battleships.Services.Friends.Interfaces
{
    public interface IFriendsService
    {
        Task<List<RemoveFriendEvent>> ListFriends();

        Task<bool> AddFriend(AddFriendEvent addFriendEvent);
        Task<bool> RemoveFriend(RemoveFriendEvent removeFriend);

    }
}
