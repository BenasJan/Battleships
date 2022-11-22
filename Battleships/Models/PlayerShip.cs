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
            List<ShipTile> temp = this.Tiles;

            foreach (var tile in temp)
            {
                tile.XCoordinate -= 1;
            }
            this.Tiles = temp;
        }        
        public void MoveDown()
        {
            List<ShipTile> temp = this.Tiles;

            foreach (var tile in temp)
            {
                tile.XCoordinate += 1;
            }
            this.Tiles = temp;
        }        
        public void MoveLeft()
        {
            List<ShipTile> temp = this.Tiles;

            foreach (var tile in temp)
            {
                tile.YCoordinate -= 1;
            }
            this.Tiles = temp;
        }        
        public void MoveRight()
        {
            List<ShipTile> temp = this.Tiles;

            foreach (var tile in temp)
            {
                tile.YCoordinate += 1;
            }
            this.Tiles = temp;
        }

     
    }
}