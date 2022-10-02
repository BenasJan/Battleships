using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        public async Task ConnectToGameSession(string gameSessionIdString)
        {
            await Clients.Group($"GAME_SESSION_{gameSessionIdString}").SendAsync("A new user has connected");
            await Groups.AddToGroupAsync(Context.ConnectionId, $"GAME_SESSION_{gameSessionIdString}");
            await Clients.Caller.SendAsync($"Successfully joined game {gameSessionIdString}");
            await base.OnConnectedAsync();
        }

        public async Task DisconnectFromGameSession(string gameSessionIdString)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"GAME_SESSION_{gameSessionIdString}");
        }

        public async Task PublishDummyMessage(string gameSessionIdString)
        {
            await Clients.Group($"GAME_SESSION_{gameSessionIdString}").SendAsync("dummy",  "WOOOOOHHHHH");

        }
    }
}