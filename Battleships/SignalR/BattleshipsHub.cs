using System.Threading.Tasks;
using Battleships.Services;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        private readonly IAttackExecutor _attackExecutor;

        public BattleshipsHub(IAttackExecutor attackExecutor)
        {
            _attackExecutor = attackExecutor;
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

        public async Task PublishAttack(AttackPayload attack)
        {
            await _attackExecutor.ExecuteAttack(attack);
        }
    }
}