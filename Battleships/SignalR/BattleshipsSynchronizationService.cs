using System;
using System.Threading.Tasks;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsSynchronizationService : IBattleshipsSynchronizationService
    {
        private readonly IHubContext<BattleshipsHub> _battleshipsHub;

        public BattleshipsSynchronizationService(IHubContext<BattleshipsHub> battleshipsHub)
        {
            _battleshipsHub = battleshipsHub;
        }

        public async Task SendAttackMessage(Guid gameSessionId, BattleshipsMessage<AttackPayload> message)
        {
            await _battleshipsHub.Clients.Group(gameSessionId.ToString()).SendAsync("underAttack", message);
        }

        public async Task SendLaunchGameMessage(Guid gameSessionId)
        {
            await _battleshipsHub.Clients.Group(gameSessionId.ToString()).SendAsync("gameLaunched", new { gameSessionId });
        }

        public async Task InviteUserToGame(Guid gameSessionId, string userId)
        {
            var group =  _battleshipsHub.Clients.Group(userId);
            await group.SendAsync("invited", new { gameSessionId });
        }
    }
}