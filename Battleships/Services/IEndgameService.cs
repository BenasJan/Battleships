using System;
using System.Threading.Tasks;

namespace Battleships.Services;

public interface IEndgameService
{
    Task RefreshEndgame(Guid gameSessionId, string attackerId);
}