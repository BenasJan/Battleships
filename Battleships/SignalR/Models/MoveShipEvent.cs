using System;
using Battleships.Services.TemplateMethod;
using Battleships.SignalR.Interfaces;

namespace Battleships.SignalR.Models;

public class MoveShipEvent : IGameEvent
{
    public string InitiatorUserId { get; set; }
    public Guid GameSessionId { get; set; }
    public Guid PlayerShipId { get; set; }
    public Direction Direction { get; set; }
}