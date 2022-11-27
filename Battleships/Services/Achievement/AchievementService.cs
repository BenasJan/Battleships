using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Repositories;
using Battleships.Services.Achievement.Interfaces;

namespace Battleships.Services.Achievement
{
    public class AchievementService : IAchievementService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;

        public AchievementService (IBattleshipsDatabase battleshipsDatabase)
        {
            _battleshipsDatabase = battleshipsDatabase;
        }

        public async Task<List<AchievementDto>> ListAchievements()
        {
            var allAchievements = await _battleshipsDatabase.AchievementsRepository.GetAll();

            return allAchievements
                .Select(item => new AchievementDto
                {
                    Name = item.Name,
                    Description = item.Description
                })
                .ToList();
        }
    }
}
