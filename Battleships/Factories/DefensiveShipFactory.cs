using Battleships.Data.Constants;
using Battleships.Models.Ships;

namespace Battleships.Factories
{
    public class DefensiveShipFactory : AbstractShipFactory
    {
        public override Ship GenerateShip(string shipType)
        {
            if (shipType == ShipTypes.Carrier)
            {
                return new CarrierShip
                {
                    ShipType = ShipTypes.Carrier,
                    PlaneCount = 5,
                    GunCount = 6
                    
                };
            }
            
            if (shipType == ShipTypes.Cruiser)
            {
                return new CruiserShip
                {
                    ShipType = ShipTypes.Cruiser,
                    TurretsCount = 2,
                    GunCount = 5
                };
            }

            return null;
        }
    }
}