
using System.Windows.Input;

namespace Battleships.Commands
{
    public class FriendsActionCommands
    {
        private readonly IFriendCommand _friendRemoveCommand;

        public FriendsActionCommands(IFriendCommand friendRemoveCommand)
        {
            _friendRemoveCommand = friendRemoveCommand;
        }

        public void TryRemove()
        {
            _friendRemoveCommand.Execute();
        }
    }
}