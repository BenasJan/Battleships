using System;
using System.Collections.Generic;
using Battleships.Models;

namespace Battleships.Services.Builders
{
    public interface IGameSessionBuilder
    {
        GameSessionBuilder WithIcon(string icon);
        GameSessionBuilder WithName(string name);
        GameSessionBuilder WithDateCreated(DateTime dateCreated);
        GameSessionBuilder WithGameLength(TimeSpan gameLength);
        GameSessionBuilder WithPlayers(List<Player> players);
        GameSessionBuilder WithSessionSettings(GameSessionSettings settings);
        GameSessionBuilder WithCurrentRound(int round);

        Models.GameSession Build();
    }
}