using System;
using System.Threading.Tasks;
using Battleships.Services.EventConsumers;
using Battleships.Visitor;

namespace Battleships.Data.Events;

public class EndgameReachedEvent : IEvent, AcceptableEvent
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

    public async Task Accept(IVisitor v)
    {
        Console.WriteLine("Working Visitor");
        await v.Visit(this);
    }
}