using System;
using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.SignalR.Interfaces
{
    public interface IBattleshipsSynchronizationService
    {
        Task SendAttackMessage(Guid gameSessionId, BattleshipsMessage<AttackPayload> message);
        Task SendLaunchGameMessage(Guid gameSessionId);
    }
}