using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsHub : Hub
    {
        public override async Task OnConnectedAsync()
        {
            var valueExists = Context.Items.TryGetValue("GameSessionId", out var gameSessionId);

            if (valueExists)
            {
                var gameSessionIdString = (string)gameSessionId;

                await Groups.AddToGroupAsync(Context.ConnectionId, $"GAME_SESSION_{gameSessionIdString}");
                await Clients.Group($"GAME_SESSION_{gameSessionIdString}").SendAsync("A new user has connected");
                await base.OnConnectedAsync();
            }
            else
            {
                var errorMessage = $"Failed to connect to hub, Game session with ID: {gameSessionId} does not exits";
                await Clients.Caller.SendAsync(errorMessage);
            }
        }
    }
}