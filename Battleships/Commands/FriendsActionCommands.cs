
using System.Windows.Input;

namespace Battleships.Commands
{
    public class FriendsActionCommands
    {
        private IFriendCommand friendRemoveCommand;

        public FriendsActionCommands(IFriendCommand friendRemoveCommand)
        {
            this.friendRemoveCommand = friendRemoveCommand;
        }

        public void TryRemove()
        {
            friendRemoveCommand.Execute();
        }
    }
}