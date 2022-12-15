using System;
using Battleships.Services.EventConsumers;

namespace Battleships.SignalR.Interfaces;

public interface IGameEvent : IEvent
{
    public Guid GameSessionId { get; set; }
}