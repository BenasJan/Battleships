using Battleships.Data.Dto;
using Battleships.Models;
using System.Reflection.Metadata;

namespace Battleships.Commands
{
    public class FriendRemoveCommand : IFriendCommand
    {
        private Friend friend;

        public FriendRemoveCommand(Friend friend)
        {
            this.friend = friend;
        }

        public void Execute()
        {
            friend.Remove();
        }
    }
}
