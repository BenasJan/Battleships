using Battleships.Data.Constants;
using Battleships.Flyweight;
using Battleships.Models.Ships;

namespace Battleships.Factories
{
    public class OffensiveShipFactory : AbstractShipFactory
    {
        private readonly ShipBaseDataFWFactory _shipBaseDataFactory;
        
        public OffensiveShipFactory(ShipBaseDataFWFactory shipBaseDataFactory)
        {
            _shipBaseDataFactory = shipBaseDataFactory;
        }

        public override Ship GenerateShip(string shipType)
        {
            ShipBaseData shipBaseData = _shipBaseDataFactory.Create(shipType);

            if (shipType == ShipTypes.Battleship)
            {
                var ship = new BattleshipShip();
                ship.SetBaseData(shipBaseData);
                return ship;
            }

            if (shipType == ShipTypes.Submarine)
            {
                var ship = new SubmarineShip();
                ship.SetBaseData(shipBaseData);
                return ship;
            }

            if (shipType == ShipTypes.Destroyer)
            {
                var ship = new SubmarineShip();
                ship.SetBaseData(shipBaseData);
                return ship;
            }

            return null;
        }
    }
}