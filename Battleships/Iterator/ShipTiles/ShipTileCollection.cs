using System.Collections;

namespace Battleships.Iterator.ShipTiles
{
    public class ShipTileCollection /*: IShipTileCollection*/
    {
        private ArrayList shipTilesList = new ArrayList();

        public ShipTileIterator CreateIterator()
        {
            return new ShipTileIterator(this);
        }

        // Get counted items
        public int Count
        {
            get
            {
                return shipTilesList.Count;
            }
        }

        // Indexer
        public object this[int index]
        {
            get { return shipTilesList[index]; }
            set { shipTilesList.Add(value); }
        }
    }
}
