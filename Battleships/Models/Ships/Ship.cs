using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Battleships.Services.Bridge;

namespace Battleships.Models.Ships
{
    public abstract class Ship : BaseModel
    {
        public string ShipTypeDiscriminator { get; set; }

        public string Name { get; set; }
        public string Description { get; set; }
        
        public string ShipType { get; set; }

        public List<UserCosmetic> UserCosmetics { get; set; }
        public List<PlayerShip> PlayerShips { get; set; }

        [NotMapped]
        public IShipState State { get; set; }

        public abstract void ChangeState();
    }
}