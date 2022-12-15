using System;
using Battleships.Services.EventConsumers;

namespace Battleships.Data.Events;

public class EndgameReachedEvent : IEvent
{
    public string InitiatorUserId
    {
        get => AttackerUserId;
        set => AttackerUserId = value;
    }

    public Guid GameSessionId { get; set; }
    public string AttackerUserId { get; set; }

    public EndgameReachedEvent(Guid gameSessionId, string attackerUserId)
    {
        GameSessionId = gameSessionId;
        AttackerUserId = attackerUserId;
    }
}