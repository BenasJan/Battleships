using System;
using System.Collections.Generic;
using Battleships.Models;
using Battleships.Models.enums;

namespace Battleships.Builders;

public class GameSessionBuilder : IGameSessionBuilder
{
    private readonly GameSession _session = new GameSession();
    
    public GameSessionBuilder WithIcon(string icon)
    {
        _session.Icon = icon;
        return this;
    }

    public GameSessionBuilder WithName(string name)
    {
        _session.Name = name;
        return this;
    }

    public GameSessionBuilder WithDateCreated(DateTime dateCreated)
    {
        _session.DateCreated = dateCreated;
        return this;
    }

    public GameSessionBuilder WithGameLength(TimeSpan gameLength)
    {
        _session.GameLength = gameLength;
        return this;
    }

    public GameSessionBuilder WithPlayers(List<Player> players)
    {
        _session.Players = players;
        return this;
    }

    public GameSessionBuilder WithSessionSettings(GameSessionSettings settings)
    {
        _session.Settings = settings;
        _session.EndgameStrategy = GetEndgameStrategyString(settings);
        return this;
    }

    public GameSessionBuilder WithCurrentRound(int round)
    {
        _session.CurrentRound = round;
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

    public GameSessionBuilder WithStatus(GameSessionStatus status)
    {
        _session.Status = status;

        return this;
    }

    public GameSession Build()
    {
        return this._session;
    }
}