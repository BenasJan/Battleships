using System.Collections.Generic;

namespace Battleships.Prototype
{
    public class AchievementManager
    {
        private Dictionary<string, AchievementPrototype> achievements = new() ;
        public AchievementPrototype this[string shortName]
        {
            get { return achievements[shortName]; }
            set { achievements.Add(shortName, value); }
        }
    }
}
