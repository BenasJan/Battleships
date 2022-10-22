using System.Threading.Tasks;
using Battleships.Services.Achievement.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Battleships.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AchievementController : ControllerBase
    {
        private readonly IAchievementService _achievementService;

        public AchievementController(IAchievementService achievementService)
        {
            _achievementService = achievementService;
        }

        [HttpGet("listAchievements")]
        public async Task<IActionResult> ListPlayers()
        {
            var achievements = await _achievementService.ListAchievements();

            return Ok(achievements);
        }
    }
}
