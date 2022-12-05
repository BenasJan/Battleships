using Battleships.Services.EventConsumers;

namespace Battleships.Data.Dto
{
    public class AddFriendEvent : IEvent
    {
        public string InitiatorUserId { get; set; }
        public string TargetUserId { get; set; }
    }
}
