using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Battleships.SignalR.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories;

public class ShipTilesRepository : BaseRepository<ShipTile>, IShipTilesRepository
{
    public ShipTilesRepository(ApplicationDbContext context) : base(context)
    {
    }

    public async Task<ShipTile> GetAttackedTile(AttackPayload attack)
    {
        return await GetSingle(tile =>
            tile.XCoordinate == attack.TargetXCoordinate && tile.YCoordinate == attack.TargetYCoordinate &&
            tile.PlayerShip.Player.UserId != attack.AttackingUserId &&
            tile.PlayerShip.Player.GameSessionId == attack.GameSessionId
        );
    }

    public async Task<List<ShipTile>> GetSessionShipTiles(Guid gameSessionId)
    {
        return await ItemSet
            .Include(tile => tile.PlayerShip)
            .Where(tile => tile.PlayerShip.Player.GameSessionId == gameSessionId)
            .ToListAsync();
    }

    public async Task<List<ShipTile>> GetPlayerTiles(Guid playerId)
    {
        return await ItemSet
            .Where(tile => tile.PlayerShip.PlayerId == playerId || tile.OwnerPlayerId == playerId)
            .ToListAsync();
    }
}