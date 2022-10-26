using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories
{
    public class GameSessionsRepository : BaseRepository<GameSession>, IGameSessionsRepository
    {
        public override async Task<List<GameSession>> GetAll()
        {
            return await ItemSet.Include(x => x.Players)
                .ThenInclude(x => x.User)
                .Include(x => x.Settings)
                .ToListAsync();
            
        }

        public async Task<GameSession> GetWithPlayers(Guid gameSessionId)
        {
            return await ItemSet
                .Include(session => session.Players)
                .ThenInclude(player => player.User)
                .Include(session => session.Settings)
                .FirstOrDefaultAsync(session => session.Id == gameSessionId);
        }

        public Task<int> GetRequiredDestroyedShipCount(Guid gameSessionId)
        {
            return GetById(gameSessionId, session => session.Settings.DestroyedShipCountForEndgame);
        }

        public Task<int> GetCurrentRound(Guid gameSessionId)
        {
            return GetById(gameSessionId, session => session.CurrentRound);
        }

        public Task<string> GetEndgameStrategy(Guid gameSessionId)
        {
            return GetById(gameSessionId, gs => gs.EndgameStrategy);
        }

        public GameSessionsRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}