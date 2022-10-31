using System.Threading.Tasks;
using Battleships.Services;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        private readonly IAttackExecutionService _attackExecutionService;

        public BattleshipsHub(IAttackExecutionService attackExecutionService)
        {
            _attackExecutionService = attackExecutionService;
        }

        public async Task ConnectUser(string userId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, userId);
        }

        public async Task ConnectToGameSession(string gameSessionIdString)
        {
            await Clients.Group(gameSessionIdString).SendAsync("A new user has connected");
            await Groups.AddToGroupAsync(Context.ConnectionId, $"GAME_SESSION_{gameSessionIdString}");
            await Clients.Caller.SendAsync($"Successfully joined game {gameSessionIdString}");
            await base.OnConnectedAsync();
        }

        public async Task DisconnectFromGameSession(string gameSessionIdString)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"GAME_SESSION_{gameSessionIdString}");
        }

        public async Task PublishAttack(string gameSessionIdString, AttackPayload attack)
        {
            await _attackExecutionService.ExecuteAttack(attack);
            await Clients.Group(gameSessionIdString).SendAsync("processAttack",  attack);
        }
    }
}