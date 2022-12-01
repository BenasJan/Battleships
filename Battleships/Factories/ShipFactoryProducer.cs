using Battleships.Data.Constants;
using Battleships.Flyweight;

namespace Battleships.Factories
{
    public class ShipFactoryProducer
    {
        public AbstractShipFactory ProduceFactory(bool? isDefensive)
        {
            ShipBaseDataFWFactory shipBaseDataFactory = new ShipBaseDataFWFactory();

            if (isDefensive == null) return new NeutralShipFactory();

            if ((bool)isDefensive)
            {
                return new DefensiveShipFactory();
            }

            return new OffensiveShipFactory(shipBaseDataFactory);
        }
    }
}