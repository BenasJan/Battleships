using System;
using System.Threading.Tasks;
using Battleships.Models.enums;
using Battleships.Repositories;

namespace Battleships.Services;

public class EndgameService : IEndgameService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEndgameStrategyService _endgameStrategyService;

    public EndgameService(
        IBattleshipsDatabase battleshipsDatabase,
        IEndgameStrategyService endgameStrategyService
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _endgameStrategyService = endgameStrategyService;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        var strategy = await _endgameStrategyService.GetEndgameStrategy(gameSessionId);

        return await strategy.IsEndgameReached(gameSessionId);
    }

    public async Task EndGameSession(Guid gameSessionId, string attackerId)
    {
        var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);
        
        session.WinnerId = attackerId;
        session.Status = GameSessionStatus.EndgameReached;

        await _battleshipsDatabase.GameSessionsRepository.Update(session);
    }
}