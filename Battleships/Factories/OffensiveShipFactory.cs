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
                    ShipType = ShipTypes.Battleship
                };
            }

            if (shipType == ShipTypes.Submarine)
            {
                return new SubmarineShip
                {
                    ShipType = ShipTypes.Submarine
                };
            }
            
            if (shipType == ShipTypes.Destroyer)
            {
                return new DestroyerShip
                {
                    ShipType = ShipTypes.Destroyer
                };
            }

            return null;
        }
    }
}