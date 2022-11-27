using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models.Ships;

namespace Battleships.Repositories
{
    public class ShipsRepository : BaseRepository<Ship>, IShipsRepository
    {
        public async Task<Ship> GetByType(string shipType)
        {
            return await GetSingle(ship => ship.ShipType == shipType);
        }

        public ShipsRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}