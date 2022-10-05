using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories
{
    public class GameSessionRepository: BaseRepository<GameSession>, IGameSessionRepository
    {
        private readonly ApplicationDbContext _context;
        private DbSet<GameSession> ItemSet => _context.Set<GameSession>();
        
        public new async Task<List<GameSession>> GetAll()
        {
            // return await ItemSet.Include(x => x.Players)
            //     .Include(x => x.Settings)
            //     .Include(x => (x as Player).User)
            //     .ToListAsync();
            
            return await ItemSet.Include(x => x.Players)
                .ThenInclude(x => x.User)
                .Include(x => x.Settings)
                .ToListAsync();
            
        }

        public GameSessionRepository(ApplicationDbContext context) : base(context)
        {
            this._context = context;
        }
    }
}