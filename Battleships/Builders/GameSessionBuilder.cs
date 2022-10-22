using System;
using System.Collections.Generic;
using Battleships.Models;

namespace Battleships.Builders;

public class GameSessionBuilder : IGameSessionBuilder
{
    private GameSession session = new GameSession();
    
    public GameSessionBuilder WithIcon(string icon)
    {
        session.Icon = icon;
        return this;
    }

    public GameSessionBuilder WithName(string name)
    {
        session.Name = name;
        return this;
    }

    public GameSessionBuilder WithDateCreated(DateTime dateCreated)
    {
        session.DateCreated = dateCreated;
        return this;
    }

    public GameSessionBuilder WithGameLength(TimeSpan gameLength)
    {
        session.GameLength = gameLength;
        return this;
    }

    public GameSessionBuilder WithPlayers(List<Player> players)
    {
        session.Players = players;
        return this;
    }

    public GameSessionBuilder WithSessionSettings(GameSessionSettings settings)
    {
        session.Settings = settings;
        return this;
    }

    public GameSession Build()
    {
        return this.session;
    }
}