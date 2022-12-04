using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Services.Friends.Interfaces;

namespace Battleships.Services.EventConsumers;

public class RemoveFriendConsumer : BaseConsumer<RemoveFriendEvent>
{
    private readonly IFriendsService _friendsService;

    public RemoveFriendConsumer(IFriendsService friendsService)
    {
        _friendsService = friendsService;
    }

    protected override async Task HandleEvent(RemoveFriendEvent @event)
    {
        await _friendsService.RemoveFriend(@event);
    }

    protected override void LogMetaData(RemoveFriendEvent @event)
    {
        Console.WriteLine("LOGGING METADATA WITH TEMPLATE EVENT CONSUMER");
        Console.WriteLine($"User {@event.InitiatorUserId} is removing friend ${@event.FriendId} from his friends list");
    }
}