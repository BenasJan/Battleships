namespace Battleships.SignalR.Models
{
    public class AttackPayload
    {
        public int TargetXCoordinate { get; set; }
        public int TargetYCoordinate { get; set; }
    }
}