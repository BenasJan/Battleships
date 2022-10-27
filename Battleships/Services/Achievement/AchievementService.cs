using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Achievement.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace Battleships.Services.Achievement
{
    public class AchievementService : IAchievementService
    {
        private readonly IBattleshipsDatabase _db;

        public AchievementService (IBattleshipsDatabase db)
        {
            _db = db;
        }

        public async Task<List<AchievementDto>> ListAchievements()
        {
            var allAchievements = await _db.AchievementsRepository.GetAll();

            var achievementList = new List<AchievementDto>();

            foreach (var item in allAchievements)
            {
                var achievement = new AchievementDto()
                {
                    Name = item.Name,
                    Description = item.Description
                };

                achievementList.Add(achievement);
            }

            return achievementList;
        }
    }
}
