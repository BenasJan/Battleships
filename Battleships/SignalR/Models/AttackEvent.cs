using System;
using Battleships.Services.EventConsumers;
using Battleships.SignalR.Interfaces;

namespace Battleships.SignalR.Models
{
    public class AttackEvent : IGameEvent
    {
        public Guid GameSessionId { get; set; }
        public string InitiatorUserId { get; set; }
        public int TargetXCoordinate { get; set; }
        public int TargetYCoordinate { get; set; }
        public bool Missed { get; set; }
    }
}