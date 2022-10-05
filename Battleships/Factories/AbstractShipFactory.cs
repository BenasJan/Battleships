using Battleships.Models.Ships;

namespace Battleships.Factories
{
    public abstract class AbstractShipFactory
    {
        public abstract Ship GenerateShip(string shipType);
    }
}