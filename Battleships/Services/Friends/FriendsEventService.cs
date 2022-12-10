using System;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Events;
using Battleships.Repositories;
using Battleships.Services.EventConsumers;
using Battleships.Services.Friends.Interfaces;

namespace Battleships.Services.Friends;

public class FriendsEventService : IFriendsEventService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEventsMediator _eventsMediator;

    public FriendsEventService(
        IBattleshipsDatabase battleshipsDatabase,
        IEventsMediator eventsMediator
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _eventsMediator = eventsMediator;
    }

    public async Task PublishEndgameEvents(Guid gameSessionId, string winnerUserId)
    {
        var loserUserId = (await _battleshipsDatabase.PlayersRepository
                .GetWhere(p => p.GameSessionId == gameSessionId && p.UserId != winnerUserId))
            .Single().UserId;
            
        var friendWonEvent = new FriendWonEvent { InitiatorUserId = winnerUserId };
        var friendLostEvent = new FriendLostEvent { InitiatorUserId = loserUserId };

        await _eventsMediator.PublishEvent(friendWonEvent);
        await _eventsMediator.PublishEvent(friendLostEvent);
    }
}