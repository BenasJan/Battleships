using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Repositories;

namespace Battleships.Services.EndgameStrategies;

public class DestroyedShipCountEndgameStrategy : IEndgameStrategy
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;

    public DestroyedShipCountEndgameStrategy(IBattleshipsDatabase battleshipsDatabase)
    {
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        var requiredDestroyedShipCount = await _battleshipsDatabase
            .GameSessionsRepository.GetRequiredDestroyedShipCount(gameSessionId);
        var tiles = await _battleshipsDatabase.ShipTilesRepository.GetSessionShipTiles(gameSessionId);
        
        var playerIds = tiles.Select(tile => tile.PlayerShip.PlayerId).Distinct().ToList();
        var destroyedPlayerShipCounts = playerIds.Select(playerId => GetDestroyedPlayerShipCount(tiles, playerId));

        return destroyedPlayerShipCounts.Any(count => count >= requiredDestroyedShipCount);
    }

    private int GetDestroyedPlayerShipCount(List<ShipTile> tiles, Guid playerId)
    {
        var playerTiles = tiles.Where(tile => tile.PlayerShip.PlayerId == playerId).ToList();
        var playerShipIds = playerTiles.Select(tile => tile.PlayerShipId.Value).Distinct().ToList();

        var destroyedShipCount = playerShipIds.Count(id => IsShipDestroyed(playerTiles, id));

        return destroyedShipCount;
    }
    
    private bool IsShipDestroyed(List<ShipTile> tiles, Guid playerShipId)
    {
        return tiles
            .Where(tile => tile.PlayerShipId == playerShipId)
            .All(tile => tile.IsDestroyed);
    }

    public string StrategyType => Data.Constants.EndgameStrategies.DestroyedShipCount;
}