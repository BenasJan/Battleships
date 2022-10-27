using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto;

namespace Battleships.Services.Achievement.Interfaces
{
    public interface IAchievementService
    {
        Task<List<AchievementDto>> ListAchievements();
    }
}
