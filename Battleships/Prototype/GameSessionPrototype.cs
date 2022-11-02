using Battleships.Models;

namespace Battleships.Prototype
{
    public abstract class GameSessionPrototype : BaseModel
    {
        public abstract GameSessionPrototype DeepClone(GameSession gameSessionPrototype);
        public abstract GameSessionPrototype ShallowClone();
    }
}
