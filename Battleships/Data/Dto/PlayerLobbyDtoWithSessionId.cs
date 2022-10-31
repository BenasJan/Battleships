using System;

namespace Battleships.Data.Dto;

public class PlayerLobbyDtoWithSessionId
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public Guid SessionId { get; set; }

    public override string ToString()
    {
        return $"{nameof(Id)}: {Id}, {nameof(Name)}: {Name}, {nameof(SessionId)}: {SessionId}";
    }
}