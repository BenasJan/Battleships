using System.Threading.Tasks;
using Battleships.Services;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        private readonly IGameSessionControl _gameSessionControl;

        public BattleshipsHub(IGameSessionControl gameSessionControl)
        {
            _gameSessionControl = gameSessionControl;
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
            await _gameSessionControl.ExecuteAttack(attack);
        }

        public async Task MoveShip(MoveShipEvent shipMove)
        {
            await _gameSessionControl.MoveShip(shipMove);
        }
    }
}