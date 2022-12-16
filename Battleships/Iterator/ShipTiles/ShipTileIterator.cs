using Battleships.Models;

namespace Battleships.Iterator.ShipTiles
{
    public class ShipTileIterator /*: IShipTileIterator*/
    {
        private ShipTileCollection collection;
        private int current = 0;
        private int step = 1;

        public ShipTileIterator(ShipTileCollection vCollection)
        {
            collection = vCollection;
        }

        public ShipTile First()
        {
            current = 0;
            return (ShipTile)collection[current];
        }

        public ShipTile Next()
        {
            current++;

            if (!IsDone)
                return (ShipTile)collection[current];
            else
                return null;
        }
        public ShipTile NextDestroyed()
        {
            while (!IsDone)
            {
                var temp = Next();
                if (temp != null && temp.IsDestroyed == true)
                {
                    return temp;
                }
            }
            return null;




            //while (!IsDone && Next())
            //{
            //    current++;
            //    if ((ShipTile)collection[current] != null)
            //    {
            //        var temp = (ShipTile)collection[current];
            //        if(temp.IsDestroyed == true)
            //        {
            //            return temp;
            //        }
            //    }
            //    else { return null; }
            //}
            //return null;
        }

        public bool IsDone
        {
            get { return current >= collection.Count; }
        }

        public ShipTile CurrentItem
        {
            get { return (ShipTile)collection[current]; }
        }

        // Gets or sets stepsize
        public int Step
        {
            get { return step; }
            set { step = value; }
        }
    }
}
