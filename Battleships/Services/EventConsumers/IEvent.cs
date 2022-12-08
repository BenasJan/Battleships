namespace Battleships.Services.EventConsumers;

public interface IEvent
{
    public string InitiatorUserId { get; set; }
}