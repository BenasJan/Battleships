using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Data.Dto;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories;

public class PlayersRepository : BaseRepository<Player>, IPlayersRepository
{
    public PlayersRepository(ApplicationDbContext context) : base(context)
    {
    }

    public override async Task<List<Player>> GetAll()
    {
        return await ItemSet.Include(x => x.User)
            .ToListAsync();
    }
}