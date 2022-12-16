using System;
using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public abstract class BaseConsumer<TEvent> where TEvent : IEvent
{
    public async Task ConsumeEvent(TEvent @event)
    {
        if (IsEventValid(@event))
        {
            LogMetaData(@event);

            try
            {
                Console.WriteLine($"HANDLING {nameof(TEvent)} EVENT WITH TEMPLATE CONSUMER");
                await HandleEvent(@event);
            }
            catch (Exception exception)
            {
                Console.WriteLine($"An error has occured while consuming event {nameof(TEvent)}");
                LogError(exception);
            }
        }
        else
        {
            LogEventInvalidError(@event);
        }
    }

    protected virtual bool IsEventValid(TEvent @event)
    {
        return !string.IsNullOrWhiteSpace(@event.InitiatorUserId);
    }

    protected virtual void LogMetaData(TEvent @event)
    {
        
    }

    protected virtual void LogError(Exception exception)
    {
        Console.WriteLine("LOGGING ERROR WITH TEMPLATE METHOD DESIGN PATTERN");
        Console.WriteLine(exception.Message);
    }
    
    protected virtual void LogEventInvalidError(TEvent @event)
    {
        Console.WriteLine("LOGGING INVALID EVENT WITH TEMPLATE DESIGN PATTERN");
        Console.WriteLine($"Invalid event {nameof(TEvent)}, {nameof(IEvent.InitiatorUserId)}");
    }

    protected abstract Task HandleEvent(TEvent @event);
}