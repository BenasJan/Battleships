using System;

namespace Battleships.Models
{
    public class UserAchievement : BaseModel
    {
        public Guid AchievementId { get; set; }
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
        public Achievement Achievement { get; set; }

    }
}
