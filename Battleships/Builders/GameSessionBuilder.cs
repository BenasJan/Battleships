using System;
using System.Collections.Generic;
using Battleships.Models;
using Battleships.Models.enums;

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
        session.EndgameStrategy = GetEndgameStrategyString(settings);
        return this;
    }
    
    private string GetEndgameStrategyString(GameSessionSettings settings)
    {
        if (settings.GameType == GameTypes.DeathMatch)
        {
            return Data.Constants.EndgameStrategies.DeathMatch;
        }

        if (settings.GameType == GameTypes.Classic)
        {
            return Data.Constants.EndgameStrategies.Classic;
        }
        
        if (settings.DestroyedShipCountForEndgame > 0)
        {
            return Data.Constants.EndgameStrategies.DestroyedShipCount;
        }

        if (settings.RoundCountLimitForEndgame > 0)
        {
            return Data.Constants.EndgameStrategies.RoundCountLimit;
        }

        return null;
    }

    public GameSession Build()
    {
        return this.session;
    }
}