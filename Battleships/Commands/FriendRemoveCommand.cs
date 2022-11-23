using System;
using Battleships.Models;

namespace Battleships.Commands
{
    public class FriendRemoveCommand : IFriendCommand
    {
        private readonly Friend _friend;

        public FriendRemoveCommand(Friend friend)
        {
            _friend = friend;
        }

        public void Execute()
        {
            Console.WriteLine($"{_friend.User1} {_friend.User2}");
        }
    }
}
