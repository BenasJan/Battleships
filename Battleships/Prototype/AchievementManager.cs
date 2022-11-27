using System.Collections.Generic;

namespace Battleships.Prototype
{
    public class AchievementManager
    {
        private readonly Dictionary<string, AchievementPrototype> _achievements = new() ;
        public AchievementPrototype this[string shortName]
        {
            get => _achievements[shortName];
            set => _achievements.Add(shortName, value);
        }
    }
}
