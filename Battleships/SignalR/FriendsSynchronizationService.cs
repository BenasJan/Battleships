using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.SignalR.Interfaces;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR;

public class FriendsSynchronizationService : IFriendsSynchronizationService
{
    private readonly IHubContext<FriendsHub> _friendsHub;

    public async Task PublishFriendLostEvent(List<string> userIds, string friendName)
    {
        var payload = new { friendName };
        
        foreach (var userId in userIds)
        {
            await _friendsHub.Clients.Group(userId).SendAsync("friendLost", payload);
        }
    }

    public async Task PublishFriendWonEvent(List<string> userIds, string friendName)
    {
        var payload = new { friendName };
        
        foreach (var userId in userIds)
        {
            await _friendsHub.Clients.Group(userId).SendAsync("friendWon", payload);
        }
    }
}