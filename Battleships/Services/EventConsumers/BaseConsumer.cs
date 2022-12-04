using System;
using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public abstract class BaseConsumer<TEvent> where TEvent : class
{
    public async Task ConsumeEvent(TEvent @event)
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

    protected virtual void LogMetaData(TEvent @event)
    {
        
    }

    protected virtual void LogError(Exception exception)
    {
        Console.WriteLine(exception.Message);
    }

    protected abstract Task HandleEvent(TEvent @event);
}