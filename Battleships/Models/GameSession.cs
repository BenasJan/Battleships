namespace Battleships.Models
{
    public class GameSession : BaseModel
    {
        public string HostUserId { get; set; }
        public ApplicationUser HostUser { get; set; }
        
        public GameSessionSettings Settings { get; set; }
    }
}