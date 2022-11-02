using System;
using System.Collections.Generic;
using Battleships.Models.Ships;

namespace Battleships.Models
{
    public class PlayerShip : BaseModel
    {
        public Guid PlayerId { get; set; }
        public Player Player { get; set; }

        public Guid ShipId { get; set; }
        public Ship Ship { get; set; }

        public List<ShipTile> Tiles { get; set; }



        public void MoveUp()
        {
            foreach (var tile in Tiles)
            {
                tile.YCoordinate += 1;
            }
        }        
        public void MoveDown()
        {
            foreach (var tile in Tiles)
            {
                tile.YCoordinate -= 1;
            }
        }        
        public void MoveLeft()
        {
            foreach (var tile in Tiles)
            {
                tile.XCoordinate -= 1;
            }
        }        
        public void MoveRight()
        {
            foreach (var tile in Tiles)
            {
                tile.YCoordinate += 1;
            }
        }

     
    }
}