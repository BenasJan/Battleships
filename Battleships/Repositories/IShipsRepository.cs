using System.Threading.Tasks;
using Battleships.Models.Ships;

namespace Battleships.Repositories
{
    public interface IShipsRepository : IRepository<Ship>
    {
        Task<Ship> GetByType(string shipType);
    }
}