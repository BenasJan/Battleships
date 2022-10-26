﻿using System;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Repositories
{
    public interface IGameSessionsRepository : IRepository<GameSession>
    {
        Task<int> GetRequiredDestroyedShipCount(Guid gameSessionId);
        Task<int> GetCurrentRound(Guid gameSessionId);
        Task<string> GetEndgameStrategy(Guid gameSessionId);
    }
}