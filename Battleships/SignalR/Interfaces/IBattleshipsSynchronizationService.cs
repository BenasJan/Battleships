using System;
using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.SignalR.Interfaces
{
    public interface IBattleshipsSynchronizationService
    {
        Task SendEndgameReached(Guid gameSessionId, string winnerName); 
        Task SendAttackMessage(Guid gameSessionId, BattleshipsMessage<AttackEvent> message);
        Task SendLaunchGameMessage(Guid gameSessionId);
        Task InviteUserToGame(Guid gameSessionId, string userId);
    }
}