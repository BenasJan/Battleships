using Battleships.Iterator;

namespace Battleships.Iterator
{
    public interface IShipCollection
    {
        ShipIterator CreateIterator();

    }
}
