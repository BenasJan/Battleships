using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;

namespace Battleships.Services.GameSession.Interfaces
{
    public interface IGameSessionService
    {
        Task<List<GameSessionDto>> ListAllSessions();
        Task<Guid> CreateSession(GameSessionRequestDto gameSessionDto);
        Task<GameSessionDto> GetSession(Guid id);
    }
}