using Battleships.Services.EventConsumers;
using System.Threading.Tasks;

namespace Battleships.Visitor
{
    public interface AcceptableEvent : IEvent
    {
        public abstract Task Accept(IVisitor v);
    }
}
