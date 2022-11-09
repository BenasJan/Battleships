using Battleships.Bridge;
using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models.Ships;
using Xunit.Abstractions;

namespace BattleshipsUnitTests.FactoryTests
{
    public class NeutralShipFactoryTests
    {
        private readonly NeutralShipFactory _neutralShipFactory;

        public NeutralShipFactoryTests()
        {
            _neutralShipFactory = new NeutralShipFactory();
        }

        [Fact]
        public void When_GeneratingNeutralShipWithDummyType_ExpectCorrectShipType()
        {
            var ship = _neutralShipFactory.GenerateShip(ShipTypes.Dummy);

            Assert.IsType<DummyShip>(ship);
        }

        [Fact]
        public void When_GeneratingNeutralShipWithNonExistingType_ExpectNull()
        {
            var ship = _neutralShipFactory.GenerateShip("non existing type");

            Assert.Null(ship);
        }
    }
}
