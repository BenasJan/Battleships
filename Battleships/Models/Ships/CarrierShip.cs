using System;

namespace Battleships.Models.Ships
{
    public class CarrierShip : Ship
    {
        public int GunCount { get; set; }
        public int PlaneCount { get; set; }
        public override void ChangeState()
        {
            base.Description = $"Carrier ship {State.GetState()}!";
        }

        public override int CalculateGuns()
        {
            return GunCount;
        }

        public override int CalculateWeight()
        {
            return GunCount + PlaneCount;
        }
    }
}