using System;
using System.Threading.Tasks;

namespace Battleships.Services.EndgameStrategies
{
    public interface IEndgameStrategy
    {
        Task<bool> IsEndgameReached(Guid gameSessionId);
        public string StrategyType { get; }
    }
}