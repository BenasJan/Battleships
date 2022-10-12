using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models.Ships;

namespace BattleshipsUnitTests.FactoryTests;

public class DefensiveShipFactoryTests
{
    private readonly DefensiveShipFactory _defensiveShipFactory;

    public DefensiveShipFactoryTests()
    {
        _defensiveShipFactory = new DefensiveShipFactory();
    }
    
    [Fact]
    public void When_GeneratingDefensiveShip_With_CarrierType_Expect_CorrectShipType()
    {
        var ship = _defensiveShipFactory.GenerateShip(ShipTypes.Carrier);

        Assert.IsType<CarrierShip>(ship);
    }

    [Fact]
    public void When_GeneratingDefensiveShip_With_CruiserType_Expect_CorrectShipType()
    {
        var ship = _defensiveShipFactory.GenerateShip(ShipTypes.Cruiser);

        Assert.IsType<CruiserShip>(ship);
    }

    [Fact]
    public void When_GeneratingDefensiveShip_With_NonExistingType_Expect_Null()
    {
        var ship = _defensiveShipFactory.GenerateShip("non existing type");
        
        Assert.Null(ship);
    }
}