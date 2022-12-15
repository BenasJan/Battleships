using System;
using System.Threading.Tasks;
using Battleships.Services.EventConsumers;
using Battleships.Visitor;

namespace Battleships.Data.Events
{
    public class RemoveFriendEvent : AcceptableEvent
    {
        public string InitiatorUserId { get; set; }
        public Guid FriendId { get; set; }

        public async Task Accept(IVisitor v)
        {
            Console.WriteLine("Working Visitor");
            await v.Visit(this);
        }
    }
}
