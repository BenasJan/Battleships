using System;
using Battleships.Models.enums;

namespace Battleships.Models
{
    public class ShipTile : BaseModel
    {
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public bool IsDestroyed { get; set; }
        public Guid PlayerShipId { get; set; }
        public PlayerShip PlayerShip { get; set; }
        public Engine Engine { get; set; }
        public Gun Guns { get; set; }
        public bool Shield { get; set; }
        public int GunCount { get; set; }
        public bool IsFlagship { get; set; }
        
    }
}