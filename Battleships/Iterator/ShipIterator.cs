using Battleships.Iterator;
using Battleships.Models;

namespace Battleships.Iterator
{
    public class ShipIterator : IShipIterator
    {
        private ShipCollection collection;
        private int current = 0;
        private int step = 1;

        public ShipIterator(ShipCollection vCollection)
        {
            this.collection = vCollection;
        }

        public PlayerShip First()
        {
            current = 0;
            return (PlayerShip)collection[current];
        }

        public PlayerShip Next()
        {
            current++;

            if (!IsDone)
                return (PlayerShip)collection[current];
            else
                return null;
        }        
        public PlayerShip NextDestroyed()
        {
            while(!IsDone)
            {
                var temp = Next();
                if(temp != null && temp.Tiles != null && temp.Tiles.Count > 0)
                {
                    var destroyed = true;
                    foreach(var tile in temp.Tiles)
                    {
                        if (!tile.IsDestroyed)
                        {
                            destroyed = false;
                        }
                    }

                    if(destroyed)
                        return temp;
                }
            }
            return null;
        }

        public bool IsDone
        {
            get { return current >= collection.Count; }
        }

        public PlayerShip CurrentItem
        {
            get { return (PlayerShip)collection[current]; }
        }
    }
}
