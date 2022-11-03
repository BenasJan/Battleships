using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Repositories;

namespace Battleships.Services.EndgameStrategies;

public class DeathMatchEndgameStrategy : IEndgameStrategy
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;

    public DeathMatchEndgameStrategy(IBattleshipsDatabase battleshipsDatabase)
    {
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        var tiles = await _battleshipsDatabase.ShipTilesRepository.GetSessionShipTiles(gameSessionId);
        var playerShipIds = tiles.Select(tile => tile.PlayerShipId.Value).Distinct().ToList();

        var isAnyShipDestroyed = playerShipIds.Any(playerShipId => IsShipDestroyed(tiles, playerShipId));

        return isAnyShipDestroyed;
    }

    private bool IsShipDestroyed(List<ShipTile> tiles, Guid playerShipId)
    {
        return tiles
            .Where(tile => tile.PlayerShipId == playerShipId)
            .All(tile => tile.IsDestroyed);
    }

    public string StrategyType => Data.Constants.EndgameStrategies.DeathMatch;
}