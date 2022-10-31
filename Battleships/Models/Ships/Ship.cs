using System.Collections.Generic;

namespace Battleships.Models.Ships
{
    public class Ship : BaseModel
    {
        public string ShipTypeDiscriminator { get; set; }

        public string Name { get; set; }
        public string Description { get; set; }

        public string ShipType { get; set; }

        public List<UserCosmetic> UserCosmetics { get; set; }
        public List<PlayerShip> PlayerShips { get; set; }
    }
}