using System.Collections.Generic;
using System.Threading.Tasks;

namespace Battleships.SignalR.Interfaces;

public interface IFriendsSynchronizationService
{
    Task PublishFriendLostEvent(List<string> userIds, string friendName);
    Task PublishFriendWonEvent(List<string> userIds, string friendName);
}