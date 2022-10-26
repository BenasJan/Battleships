using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.Services.EndgameStrategies;

namespace Battleships.Services;

public class EndgameStrategyService : IEndgameStrategyService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEnumerable<IEndgameStrategy> _endgameStrategies;

    public EndgameStrategyService(
        IBattleshipsDatabase battleshipsDatabase,
        IEnumerable<IEndgameStrategy> endgameStrategies
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _endgameStrategies = endgameStrategies;
    }

    public async Task<IEndgameStrategy> GetEndgameStrategy(Guid gameSessionId)
    {
        var strategyString = await _battleshipsDatabase.GameSessionsRepository.GetEndgameStrategy(gameSessionId);
        var endgameStrategy = _endgameStrategies.First(strategy => strategy.StrategyType == strategyString);

        return endgameStrategy;
    }
}