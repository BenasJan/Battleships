using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.SignalR.Models;

namespace Battleships.Repositories
{
    public interface IShipTilesRepository : IRepository<ShipTile>
    {
        Task<List<ShipTile>> GetAttackedTiles(AttackEvent attack);
        Task<List<ShipTile>> GetSessionShipTiles(Guid gameSessionId);
        Task<List<ShipTile>> GetPlayerTiles(Guid playerId);
    }   
}