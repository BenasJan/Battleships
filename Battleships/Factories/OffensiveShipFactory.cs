using Battleships.Data.Constants;
using Battleships.Models.Ships;

namespace Battleships.Factories
{
    public class OffensiveShipFactory : AbstractShipFactory
    {
        public override Ship GenerateShip(string shipType)
        {
            if (shipType == ShipTypes.Battleship)
            {
                return new BattleshipShip
                {
                    ShipType = ShipTypes.Battleship,
                    TurretsCount = 3,
                    GunCount = 8
                };
            }

            if (shipType == ShipTypes.Submarine)
            {
                return new SubmarineShip
                {
                    ShipType = ShipTypes.Submarine,
                };
            }
            
            if (shipType == ShipTypes.Destroyer)
            {
                return new DestroyerShip
                {
                    ShipType = ShipTypes.Destroyer,
                    TurretsCount = 4,
                    GunCount = 8,
                    ArmourMm = 800
                };
            }

            return null;
        }
    }
}