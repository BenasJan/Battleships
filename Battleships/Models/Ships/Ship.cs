using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Battleships.Bridge;

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
        
        protected IShipState _state;

        [NotMapped]
        public IShipState State
        {
            get
            {
                return _state;
            }
            set
            {
                _state = value;
            }
        }

        public abstract void ChangeState();

        void n()
        {
            State.ChangeState();
            _state.ChangeState();
        }
    }
}