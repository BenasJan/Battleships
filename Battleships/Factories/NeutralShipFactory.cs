using Battleships.Data.Constants;
using Battleships.Models.Ships;

namespace Battleships.Factories
{
    public class NeutralShipFactory : AbstractShipFactory
    {
        public override Ship GenerateShip(string shipType)
        {
            if (shipType == ShipTypes.Dummy)
            {
                return new CarrierShip
                {
                    ShipType = ShipTypes.Dummy
                };
            }

            return null;
        }
    }
}