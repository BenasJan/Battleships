using System.Collections;
using Battleships.Iterator;

namespace Battleships.Iterator
{
    public class ShipCollection : IShipCollection
    {
        private ArrayList shipList = new ArrayList();

        public ShipIterator CreateIterator()
        {
            return new ShipIterator(this);
        }

        public int Count
        {
            get
            {
                return shipList.Count;
            }
        }

        public object this[int index]
        {
            get { return shipList[index]; }
            set { shipList.Add(value); }
        }
    }
}
