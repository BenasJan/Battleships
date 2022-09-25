using System.Collections.Generic;

namespace Battleships.Models
{
    public class Ship : BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public List<UserCosmetic> UserCosmetics { get; set; }
        public List<PlayerShip> PlayerShips { get; set; }
    }
}