using System;

namespace Battleships.Models
{
    public class PlayerShip : BaseModel
    {
        public Guid PlayerId { get; set; }
        public Player Player { get; set; }

        public Guid ShipId { get; set; }
        public Ship Ship { get; set; }
    }
}