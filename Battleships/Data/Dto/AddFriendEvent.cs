using Battleships.Services.EventConsumers;
using Battleships.Visitor;
using System.Threading.Tasks;

namespace Battleships.Data.Dto
{
    public class AddFriendEvent : AcceptableEvent
    {
        public string InitiatorUserId { get; set; }
        public string TargetUserId { get; set; }

        public async Task Accept(IVisitor v)
        {
            await v.Visit(this);
        }
    }
}
