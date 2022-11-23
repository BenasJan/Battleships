using System;
using System.Threading.Tasks;
using Battleships.Repositories;

namespace Battleships.Services.EndgameStrategies
{
    public class RoundCountLimitEndgameStrategy : IEndgameStrategy
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;

        public RoundCountLimitEndgameStrategy(
            IBattleshipsDatabase battleshipsDatabase
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
        }

        public async Task<bool> IsEndgameReached(Guid gameSessionId)
        {
            var round = await _battleshipsDatabase.GameSessionsRepository.GetCurrentRound(gameSessionId);
            var settings = await _battleshipsDatabase.GameSessionSettingsRepository.GetBySessionId(gameSessionId);

            return round >= settings.RoundCountLimitForEndgame;
        }

        public string StrategyType => Data.Constants.EndgameStrategies.RoundCountLimit;
    }
}