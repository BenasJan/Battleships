using System;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Models;

namespace Battleships.Repositories;

public class GameSessionSettingsRepository : BaseRepository<GameSessionSettings>, IGameSessionSettingsRepository
{
    public async Task<GameSessionSettings> GetBySessionId(Guid gameSessionId)
    {
        return await GetSingle(settings => settings.GameSessionId == gameSessionId);
    }

    public GameSessionSettingsRepository(ApplicationDbContext context) : base(context)
    {
    }
}