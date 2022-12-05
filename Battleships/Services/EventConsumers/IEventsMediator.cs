using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public interface IEventsMediator
{
    Task PublishEvent<TEvent>(TEvent @event) where TEvent : IEvent;
}