using Battleships.Data.Constants;

namespace Battleships.Factories
{
    public class ShipFactoryProducer
    {
        public AbstractShipFactory ProduceFactory(bool? isDefensive)
        {
            if (isDefensive == null) return new NeutralShipFactory();

            if ((bool)isDefensive)
            {
                return new DefensiveShipFactory();
            }

            return new OffensiveShipFactory();
        }
    }
}