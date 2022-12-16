using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Events;
using Battleships.Services.Friends.Interfaces;

namespace Battleships.Services.EventConsumers;

public class AddFriendConsumer : BaseConsumer<AddFriendEvent>
{
    private readonly IFriendsService _friendsService;

    public AddFriendConsumer(IFriendsService friendsService)
    {
        _friendsService = friendsService;
    }

    protected override async Task HandleEvent(AddFriendEvent @event)
    {
        await _friendsService.AddFriend(@event);
    }

    protected override void LogMetaData(AddFriendEvent @event)
    {
        Console.WriteLine("LOGGING METADATA WITH TEMPLATE EVENT CONSUMER");
        Console.WriteLine($"User {@event.InitiatorUserId} is adding user ${@event.TargetUserId} as friend");
    }
}