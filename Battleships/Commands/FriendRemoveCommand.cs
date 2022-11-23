using Battleships.Data.Dto;
using Battleships.Models;
using System.Reflection.Metadata;

namespace Battleships.Commands
{
    public class FriendRemoveCommand : IFriendCommand
    {
        private Friend _friend;

        public FriendRemoveCommand(Friend friend)
        {
            _friend = friend;
        }

        public void Execute()
        {
        }
    }
}
