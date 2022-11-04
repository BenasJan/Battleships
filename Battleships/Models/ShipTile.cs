using System;

namespace Battleships.Models
{
    public class ShipTile : BaseModel
    {
        public int XCoordinate { get; set; }
        public int YCoordinate { get; set; }
        public bool IsDestroyed { get; set; }

        public Guid? AttackerPlayerId { get; set; }
        public Player AttackerPlayer { get; set; }

        public Guid? TargetPlayerId { get; set; }
        public Player TargetPlayer { get; set; }

        public Guid? PlayerShipId { get; set; }
        public PlayerShip PlayerShip { get; set; }
    }
}