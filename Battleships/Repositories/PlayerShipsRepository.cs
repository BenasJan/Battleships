using System;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories;

public class PlayerShipsRepository : BaseRepository<PlayerShip>
{
    public PlayerShipsRepository(ApplicationDbContext context) : base(context)
    {
    }

    public override async Task<PlayerShip> GetById(Guid id)
    {
        return await ItemSet
            .Include(ps => ps.Ship)
            .Include(ps => ps.Tiles)
            .FirstOrDefaultAsync(ps => ps.Id == id);
    }
}