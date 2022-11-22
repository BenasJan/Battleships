using System;

namespace Battleships.Models.Ships
{
    public class CarrierShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Carrier ship {_state.GetState()}!";
        }
    }
}