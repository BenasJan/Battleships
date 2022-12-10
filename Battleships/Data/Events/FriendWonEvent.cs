using Battleships.Services.EventConsumers;

namespace Battleships.Data.Events;

public class FriendWonEvent : IEvent
{
    public string InitiatorUserId { get; set; }
}