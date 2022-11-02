using System;

namespace Battleships.Data.Dto;

public class PlayerLobbyDto
{
    public Guid Id { get; set; }
    public string UserId { get; set; }
    public string Name { get; set; }
}