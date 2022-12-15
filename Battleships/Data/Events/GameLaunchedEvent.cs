using System;
using Battleships.Services.EventConsumers;

namespace Battleships.Data.Events;

public class GameLaunchedEvent : IEvent
{
    public GameLaunchedEvent(string initiatorUserId, Guid gameSessionId)
    {
        InitiatorUserId = initiatorUserId;
        GameSessionId = gameSessionId;
    }

    public string InitiatorUserId { get; set; }
    public Guid GameSessionId { get; set; }
}