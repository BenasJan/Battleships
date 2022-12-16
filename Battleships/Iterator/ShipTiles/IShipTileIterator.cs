using Battleships.Models;

namespace Battleships.Iterator.ShipTiles
{
    public interface IShipIterator
    {
        PlayerShip First();
        PlayerShip Next();
        PlayerShip CurrentItem { get; }
        bool IsDone { get; }
        PlayerShip NextDestroyed();
    }
}
