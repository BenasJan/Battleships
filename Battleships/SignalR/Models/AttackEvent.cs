using System;
using Battleships.Services.EventConsumers;

namespace Battleships.SignalR.Models
{
    public class AttackEvent : IEvent
    {
        public Guid GameSessionId { get; set; }
        public string InitiatorUserId { get; set; }
        public int TargetXCoordinate { get; set; }
        public int TargetYCoordinate { get; set; }
    }
}