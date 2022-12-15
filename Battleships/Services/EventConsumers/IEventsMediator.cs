using Battleships.Visitor;
using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public interface IEventsMediator
{
    Task PublishEvent<TEvent>(AcceptableEvent @event) where TEvent : IEvent;
}