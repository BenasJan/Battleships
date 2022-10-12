using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models.Ships;

namespace BattleshipsUnitTests.FactoryTests;

public class OffensiveShipFactoryTests
{
    private readonly OffensiveShipFactory _offensiveShipFactory;

    public OffensiveShipFactoryTests()
    {
        _offensiveShipFactory = new OffensiveShipFactory();
    }

    [Fact]
    public void When_GeneratingOffensiveShip_With_BattleshipType_Expect_CorrectShipType()
    {
        var ship = _offensiveShipFactory.GenerateShip(ShipTypes.Battleship);

        Assert.IsType<BattleshipShip>(ship);
    }

    [Fact]
    public void When_GeneratingOffensiveShip_With_SubmarineType_Expect_CorrectShipType()
    {
        var ship = _offensiveShipFactory.GenerateShip(ShipTypes.Submarine);

        Assert.IsType<SubmarineShip>(ship);
    }

    [Fact]
    public void When_GeneratingOffensiveShip_With_DestroyerType_Expect_CorrectShipType()
    {
        var ship = _offensiveShipFactory.GenerateShip(ShipTypes.Destroyer);

        Assert.IsType<DestroyerShip>(ship);
    }

    [Fact]
    public void When_GeneratingOffensiveShip_With_NonExistingType_Expect_Null()
    {
        var ship = _offensiveShipFactory.GenerateShip("non existing type");
        
        Assert.Null(ship);
    }
}