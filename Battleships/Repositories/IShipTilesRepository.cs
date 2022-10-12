using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.SignalR.Models;

namespace Battleships.Repositories;

public interface IShipTilesRepository : IRepository<ShipTile>
{
    Task<ShipTile> GetAttackedTile(AttackPayload attack);
}