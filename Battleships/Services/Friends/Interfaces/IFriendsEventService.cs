using System;
using System.Threading.Tasks;

namespace Battleships.Services.Friends.Interfaces;

public interface IFriendsEventService
{
    Task PublishEndgameEvents(Guid gameSessionId, string winnerUserId);
}