using Battleships.Models;

namespace Battleships.Prototype
{
    public abstract class AchievementPrototype : BaseModel
    {
        public abstract AchievementPrototype Clone();
    }
}
