namespace Battleships.SignalR.Models
{
    public class BattleshipsMessage<TPayload>
    {
        public string CallerUserId { get; set; }
        public TPayload Payload { get; set; }
    }
}