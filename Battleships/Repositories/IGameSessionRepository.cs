using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Repositories
{
    public interface IGameSessionRepository
    {
        Task<List<GameSession>> GetAll();
    }
}