using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public interface IConsumer<TEvent> where TEvent : IEvent
{
    Task ConsumeEvent(TEvent @event);
}