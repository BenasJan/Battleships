using Battleships.Data.Dto;
using Battleships.Data.Events;
using Battleships.SignalR.Models;
using System.Threading.Tasks;

namespace Battleships.Visitor
{
    public interface IVisitor
    {
        public Task Visit(AddFriendEvent addFriendEvent);
        public Task Visit(RemoveFriendEvent removeFriendEvent);
        public Task Visit(GameLaunchedEvent gameLaunchedEvent);
        public Task Visit(EndgameReachedEvent endgameReachedEvent);
        public Task Visit(FriendWonEvent friendWonEvent);
        public Task Visit(FriendLostEvent friendLostEvent);
        //public Task Visit(AttackEvent attackEvent);
    }
}
