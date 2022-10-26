using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Repositories;

namespace Battleships.Services.EndgameStrategies;

public class ClassicEndgameStrategy : IEndgameStrategy
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;

    public ClassicEndgameStrategy(
        IBattleshipsDatabase battleshipsDatabase
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        var tiles = await _battleshipsDatabase.ShipTilesRepository.GetSessionShipTiles(gameSessionId);
        var playerIds = tiles.Select(tile => tile.PlayerShip.PlayerId).Distinct().ToList();
        
        var (playerOneId, playerTwoId) = (playerIds[0], playerIds[1]);
        var isPlayerOneShipsDestroyed = IsAllPlayerShipsDestroyed(tiles, playerOneId);
        var isPlayerTwoShipsDestroyed = IsAllPlayerShipsDestroyed(tiles, playerTwoId);

        return isPlayerOneShipsDestroyed || isPlayerTwoShipsDestroyed;
    }

    private bool IsAllPlayerShipsDestroyed(List<ShipTile> tiles, Guid playerId)
    {
        return tiles
            .Where(tile => tile.PlayerShip.PlayerId == playerId)
            .All(tile => tile.IsDestroyed);
    }

    public string StrategyType => Data.Constants.EndgameStrategies.Classic;
}