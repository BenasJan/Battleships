using System;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Repositories;

public interface IGameSessionSettingsRepository : IRepository<GameSessionSettings>
{
    Task<GameSessionSettings> GetBySessionId(Guid gameSessionId);
}