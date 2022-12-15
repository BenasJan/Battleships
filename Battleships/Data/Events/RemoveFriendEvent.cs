using System;
using Battleships.Services.EventConsumers;

namespace Battleships.Data.Events
{
    public class RemoveFriendEvent : IEvent
    {
        public string InitiatorUserId { get; set; }
        public Guid FriendId { get; set; }
    }
}
