using System;
using System.Threading.Tasks;
using Battleships.Services.EndgameStrategies;

namespace Battleships.Services
{
    public interface IEndgameStrategyService
    {
        Task<IEndgameStrategy> GetEndgameStrategy(Guid gameSessionId);
    }
}