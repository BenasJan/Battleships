using System.Threading.Tasks;
using Battleships.Services;
using Battleships.Services.EventConsumers;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        private readonly IEventsMediator _eventsMediator;

        public BattleshipsHub(IEventsMediator eventsMediator)
        {
            _eventsMediator = eventsMediator;
        }

        public async Task ConnectUser(string userId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, userId);
        }

        public async Task ConnectToGameSession(string gameSessionIdString)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, gameSessionIdString);
        }

        public async Task DisconnectFromGameSession(string gameSessionIdString)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, gameSessionIdString);
        }

        public async Task PublishAttack(AttackEvent attack)
        {
            await _eventsMediator.PublishEvent(attack);
        }
    }
}