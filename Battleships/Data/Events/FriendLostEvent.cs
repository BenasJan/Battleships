using Battleships.Services.EventConsumers;

namespace Battleships.Data.Events;

public class FriendLostEvent : IEvent
{
    public string InitiatorUserId { get; set; }
}