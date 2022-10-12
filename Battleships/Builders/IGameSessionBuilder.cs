using System;
using System.Collections.Generic;
using Battleships.Models;

namespace Battleships.Builders;

public interface IGameSessionBuilder
{
    GameSessionBuilder WithIcon(string icon);
    GameSessionBuilder WithName(string name);
    GameSessionBuilder WithDateCreated(DateTime dateCreated);
    GameSessionBuilder WithGameLength(TimeSpan gameLength);
    GameSessionBuilder WithWinnerId(Guid id);
    GameSessionBuilder WithPlayers(List<Player> players);
    GameSessionBuilder WithSessionSettings(GameSessionSettings settings);

    GameSession Build();
}