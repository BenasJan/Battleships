using System;
using System.Threading.Tasks;
using Battleships.Services.EventConsumers;
using Battleships.Visitor;

namespace Battleships.Data.Events;

public class GameLaunchedEvent : IEvent, AcceptableEvent
{
    public GameLaunchedEvent(string initiatorUserId, Guid gameSessionId)
    {
        InitiatorUserId = initiatorUserId;
        GameSessionId = gameSessionId;
    }

    public string InitiatorUserId { get; set; }
    public Guid GameSessionId { get; set; }

    public async Task Accept(IVisitor v)
    {
        Console.WriteLine("Working Visitor");
        await v.Visit(this);
    }
}