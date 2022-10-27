using System;

namespace Battleships.Data.Dto;

public class PlayerLobbyDtoWithSessionId
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public Guid SessionId { get; set; }
}