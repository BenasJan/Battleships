using System;
using System.Threading.Tasks;
using Battleships.Services.EventConsumers;
using Battleships.Visitor;

namespace Battleships.Data.Dto
{
    public class RemoveFriendEvent : IEvent, AcceptableEvent
    {
        public string InitiatorUserId { get; set; }
        public Guid FriendId { get; set; }

        public async Task Accept(IVisitor v)
        {
            await v.Visit(this);
        }
    }
}
