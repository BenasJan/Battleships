using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;

namespace Battleships.Services.GameSession.Interfaces
{
    public interface IGameSessionService
    {
        Task<List<GameSessionDto>> ListAllSessions();
        Task<Guid> CreateSession(GameSessionRequestDto gameSessionDto);
        Task<GameSessionDto> GetSession(Guid id);

        Task<InGameSessionDto> MoveShipInSession(Guid gameSessionId, Guid shipId, string direction);
    }
}