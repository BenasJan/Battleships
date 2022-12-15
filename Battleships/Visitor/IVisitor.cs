using Battleships.Data.Dto;
using Battleships.SignalR.Models;
using System.Threading.Tasks;

namespace Battleships.Visitor
{
    public interface IVisitor
    {
        public Task Visit(AddFriendEvent addFriendEvent);
        public Task Visit(RemoveFriendEvent removeFriendEvent);
        public Task Visit(AttackEvent attackEvent);
    }
}
