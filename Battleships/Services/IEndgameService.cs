using System;
using System.Threading.Tasks;

namespace Battleships.Services;

public interface IEndgameService
{
    Task<bool> IsEndgameReached(Guid gameSessionId);
    Task EndGameSession(Guid gameSessionId, string attackerId);
}