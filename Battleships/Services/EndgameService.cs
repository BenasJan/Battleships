using System;
using System.Threading.Tasks;
using Battleships.Data.Events;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.EventConsumers;
using Battleships.Services.Friends.Interfaces;

namespace Battleships.Services;

public class EndgameService : IEndgameService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEndgameStrategyService _endgameStrategyService;
    private readonly IEventsMediator _eventsMediator;
    private readonly IFriendsService _friendsService;

    public EndgameService(
        IBattleshipsDatabase battleshipsDatabase,
        IEndgameStrategyService endgameStrategyService,
        IEventsMediator eventsMediator,
        IFriendsService friendsService)
    {
        _battleshipsDatabase = battleshipsDatabase;
        _endgameStrategyService = endgameStrategyService;
        _eventsMediator = eventsMediator;
        _friendsService = friendsService;
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

        var endgameReachedEvent = new EndgameReachedEvent(gameSessionId, attackerId);
        await _eventsMediator.PublishEvent(endgameReachedEvent);
        await _friendsService.PublishEndgameEvents(gameSessionId, attackerId);
    }
}