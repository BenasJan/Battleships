using Battleships.Factories;

namespace BattleshipsUnitTests.FactoryTests;

public class ShipFactoryProducerTests
{
    private readonly ShipFactoryProducer _shipFactoryProducer; 
    
    public ShipFactoryProducerTests()
    {
        _shipFactoryProducer = new ShipFactoryProducer();
    }

    [Fact]
    public void When_GettingFactory_With_IsDefensiveFalse_Expect_OffensiveShipFactory()
    {
        var factory = _shipFactoryProducer.ProduceFactory(false);

        Assert.IsType<OffensiveShipFactory>(factory);
    }
    
    [Fact]
    public void When_GettingFactory_With_IsDefensiveTrue_Expect_DefensiveShipFactory()
    {
        var factory = _shipFactoryProducer.ProduceFactory(true);

        Assert.IsType<DefensiveShipFactory>(factory);
    }
}