using System;
using System.Threading.Tasks;
using Battleships.Services.EndgameStrategies;

namespace Battleships.Services;

public class EndgameStrategyService : IEndgameStrategyService
{
    private IEndgameStrategy _endgameStrategy;
    
    public void SetEndgameStrategy(IEndgameStrategy endgameStrategy)
    {
        _endgameStrategy = endgameStrategy;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        return await _endgameStrategy.IsEndgameReached(gameSessionId);
    }
}