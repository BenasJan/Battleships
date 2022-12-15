using Battleships.Services.EventConsumers;
using Battleships.Visitor;
using System;
using System.Threading.Tasks;

namespace Battleships.Data.Events
{
    public class AddFriendEvent : AcceptableEvent
    {
        public string InitiatorUserId { get; set; }
        public string TargetUserId { get; set; }

        public async Task Accept(IVisitor v)
        {
            Console.WriteLine("Working Visitor");
            await v.Visit(this);
        }
    }
}
