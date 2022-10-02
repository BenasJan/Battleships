using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace Battleships.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string Name { get; set; }
        public string Surname { get; set; }

        public List<UserCosmetic> Cosmetics { get; set; }
        public List<Player> Players { get; set; }
        public List<UserAchievement> UserAchievements { get; set; }
    }
}