using System;

namespace Battleships.Data.Dto;

public class FriendDto
{
    
    public string Name { get; set; }
    public int GamesPlayedCount { get; set; }
    public int GamesWonCount { get; set; }
    public Guid FriendId { get; set; }
    public string UserId { get; set; }
}