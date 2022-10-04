using System;

namespace Battleships.SignalR.Models
{
    public class AttackPayload
    {
        public Guid GameSessionId { get; set; }
        public string AttackingUserId { get; set; }
        public int TargetXCoordinate { get; set; }
        public int TargetYCoordinate { get; set; }
    }
}