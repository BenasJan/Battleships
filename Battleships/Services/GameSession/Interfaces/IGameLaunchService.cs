using System;
using System.Threading.Tasks;

namespace Battleships.Services.GameSession.Interfaces;

public interface IGameLaunchService
{
    Task LaunchGame(Guid gameSessionId);
}