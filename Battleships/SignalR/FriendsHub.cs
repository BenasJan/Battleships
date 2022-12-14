using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Events;
using Battleships.Services.EventConsumers;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR;

public class FriendsHub : Hub
{
    private readonly IEventsMediator _eventsMediator;

    public FriendsHub(IEventsMediator eventsMediator)
    {
        _eventsMediator = eventsMediator;
    }

    public async Task ConnectToHub(string userId)
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, userId);
    }

    public async Task AddFriend(AddFriendEvent @event)
    {
        await _eventsMediator.PublishEvent(@event);
    }

    public async Task RemoveFriend(RemoveFriendEvent @event)
    {
        await _eventsMediator.PublishEvent(@event);
    }
}