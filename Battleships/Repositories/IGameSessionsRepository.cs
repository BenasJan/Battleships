using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Models;

namespace Battleships.Repositories
{
    public interface IGameSessionsRepository : IRepository<GameSession>
    {
        Task<GameSessionDto> GetWithPlayers(Guid gameSessionId);
        Task<int> GetRequiredDestroyedShipCount(Guid gameSessionId);
        Task<int> GetCurrentRound(Guid gameSessionId);
        Task<string> GetEndgameStrategy(Guid gameSessionId);
        Task<(Guid, Guid)> GetPlayerIds(Guid gameSessionId, string currentUserId);
        Task<InGameSessionDto> GetInGameSession(Guid gameSessionId, string currentUserId);
        Task<GameSession> GetWithPlayersForCloning(Guid gameSessionId);
    }
}