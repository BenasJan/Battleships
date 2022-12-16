using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Events;
using Battleships.Repositories;
using Battleships.Services.Users;
using Battleships.SignalR.Interfaces;

namespace Battleships.Services.EventConsumers;

public class EventsMediator : IEventsMediator
{
    private readonly BaseConsumer<AddFriendEvent> _addFriendConsumer;
    private readonly BaseConsumer<RemoveFriendEvent> _removeFriendConsumer;
    private readonly IFriendsSynchronizationService _friendsSynchronizationService;
    private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IUserManager _userManager;

    public EventsMediator(
        BaseConsumer<AddFriendEvent> addFriendConsumer,
        BaseConsumer<RemoveFriendEvent> removeFriendConsumer,
        IFriendsSynchronizationService friendsSynchronizationService,
        IBattleshipsSynchronizationService battleshipsSynchronizationService,
        IBattleshipsDatabase battleshipsDatabase,
        IUserManager userManager
    )
    {
        _addFriendConsumer = addFriendConsumer;
        _removeFriendConsumer = removeFriendConsumer;
        _friendsSynchronizationService = friendsSynchronizationService;
        _battleshipsSynchronizationService = battleshipsSynchronizationService;
        _battleshipsDatabase = battleshipsDatabase;
        _userManager = userManager;
    }

    public async Task PublishEvent<TEvent>(TEvent @event) where TEvent : IEvent
    {
        List<string> userIds;
        string userName;

        Console.WriteLine("PUBLISHING EVENT WITH MEDIATOR");
        
        switch (@event)
        {
            case AddFriendEvent addFriendEvent:
                await _addFriendConsumer.ConsumeEvent(addFriendEvent);
                break;
            case RemoveFriendEvent removeFriendEvent:
                await _removeFriendConsumer.ConsumeEvent(removeFriendEvent);
                break;
            case GameLaunchedEvent gameLaunchedEvent:
                await _battleshipsSynchronizationService.SendLaunchGameMessage(gameLaunchedEvent.GameSessionId);
                break;
            case EndgameReachedEvent endgameReachedEvent:
                var winnerName = (await _userManager.GetById(endgameReachedEvent.AttackerUserId)).UserName;
                await _battleshipsSynchronizationService.SendEndgameReached(endgameReachedEvent.GameSessionId, winnerName);
                break;
            case FriendWonEvent friendWonEvent:
                userIds = await GetIdsOfUserAddedAsFriend(friendWonEvent.InitiatorUserId);
                userName = await GetUserEmail(friendWonEvent.InitiatorUserId);
                
                await _friendsSynchronizationService.PublishFriendWonEvent(userIds, userName);
                break;
            case FriendLostEvent friendLostEvent:
                userIds = await GetIdsOfUserAddedAsFriend(friendLostEvent.InitiatorUserId);
                userName = await GetUserEmail(friendLostEvent.InitiatorUserId);

                await _friendsSynchronizationService.PublishFriendLostEvent(userIds, userName);
                break;
        }
    }

    private async Task<List<string>> GetIdsOfUserAddedAsFriend(string userId)
    {
        var userIds =
            (await _battleshipsDatabase.FriendsRepository
                .GetWhere(fr => fr.TargetUserId == userId)
            )
            .Select(fr => fr.InitiatingUserId)
            .ToList();

        return userIds;
    }

    private async Task<string> GetUserEmail(string userId)
    {
        return (await _userManager.GetById(userId)).Email;
    }
}
