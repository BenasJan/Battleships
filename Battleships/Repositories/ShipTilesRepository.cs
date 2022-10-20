using System.Linq;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Battleships.SignalR.Models;

namespace Battleships.Repositories;

public class ShipTilesRepository : BaseRepository<ShipTile>, IShipTilesRepository
{
    public ShipTilesRepository(ApplicationDbContext context) : base(context)
    {
    }

    public async Task<ShipTile> GetAttackedTile(AttackPayload attack)
    {
        return (await GetWhere(tile =>
            tile.XCoordinate == attack.TargetXCoordinate && tile.YCoordinate == attack.TargetYCoordinate &&
            tile.PlayerShip.Player.UserId != attack.AttackingUserId &&
            tile.PlayerShip.Player.GameSessionId == attack.GameSessionId
        )).SingleOrDefault();
    }
}