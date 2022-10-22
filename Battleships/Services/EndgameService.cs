using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.EndgameStrategies;

namespace Battleships.Services;

public class EndgameService : IEndgameService
{
    private readonly IEndgameStrategyService _endgameStrategyService;
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEnumerable<IEndgameStrategy> _endgameStrategies;

    public EndgameService(
        IEndgameStrategyService endgameStrategyService,
        IBattleshipsDatabase battleshipsDatabase,
        IEnumerable<IEndgameStrategy> endgameStrategies
    )
    {
        _endgameStrategyService = endgameStrategyService;
        _battleshipsDatabase = battleshipsDatabase;
        _endgameStrategies = endgameStrategies;
    }

    public async Task RefreshEndgame(Guid gameSessionId, string attackerId)
    {
        var strategy = await GetStrategy(gameSessionId);
        _endgameStrategyService.SetEndgameStrategy(strategy);
        
        if (await _endgameStrategyService.IsEndgameReached(gameSessionId))
        {
            var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);

            session.WinnerId = attackerId;
            session.IsOver = true;

            await _battleshipsDatabase.GameSessionsRepository.Update(session);
        }
    }

    private async Task<IEndgameStrategy> GetStrategy(Guid gameSessionId)
    {
        var strategyString = await GetStrategyString(gameSessionId);
        var endgameStrategy = _endgameStrategies.First(strategy => strategy.StrategyType == strategyString);

        return endgameStrategy;
    }

    private async Task<string> GetStrategyString(Guid gameSessionId)
    {
        var settings = await _battleshipsDatabase.GameSessionSettingsRepository.GetBySessionId(gameSessionId);

        if (settings.GameType == GameTypes.DeathMatch)
        {
            return Data.Constants.EndgameStrategies.DeathMatch;
        }

        if (settings.GameType == GameTypes.Classic)
        {
            return Data.Constants.EndgameStrategies.Classic;
        }
        
        if (settings.DestroyedShipCountForEndgame > 0)
        {
            return Data.Constants.EndgameStrategies.DestroyedShipCount;
        }

        if (settings.RoundCountLimitForEndgame > 0)
        {
            return Data.Constants.EndgameStrategies.RoundCountLimit;
        }

        return null;
    }
}