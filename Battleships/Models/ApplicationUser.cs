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
        public List<GameSession> WonGames { get; set; }
        public List<Friend> Friends { get; set; }
        public List<Friend> FriendsIAmAddedBy { get; set; }

        public override string ToString()
        {
            return $"{base.ToString()}, {nameof(Name)}: {Name}, {nameof(Surname)}: {Surname}, {nameof(Cosmetics)}: {Cosmetics}, {nameof(UserAchievements)}: {UserAchievements}";
        }
    }
}