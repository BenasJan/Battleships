using System;

namespace Battleships.Models
{
    public class UserCosmetic : BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }

        public Guid? ShipId { get; set; }
        public Ship Ship { get; set; }
    }
}