using System;
using System.Threading.Tasks;
using Battleships.Services.EndgameStrategies;

namespace Battleships.Services;

public interface IEndgameStrategyService
{
    void SetEndgameStrategy(IEndgameStrategy endgameStrategy);
    Task<bool> IsEndgameReached(Guid gameSessionId);
}