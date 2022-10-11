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
                return new BattleshipShip();
            }

            if (shipType == ShipTypes.Submarine)
            {
                return new SubmarineShip();
            }
            
            if (shipType == ShipTypes.Destroyer)
            {
                return new DestroyerShip();
            }

            return null;
        }
    }
}