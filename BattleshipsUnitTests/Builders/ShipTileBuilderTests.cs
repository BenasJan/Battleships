using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Services.Builders;

namespace BattleshipsUnitTests.Builders;

public class ShipTileBuilderTests
{
    private readonly ShipTileBuilder _shipTileBuilder = new();

    [Fact]
    public void When_BuildingShip_Expect_CorrectShipBuilt()
    {
        var playerShip = new PlayerShip { Id = Guid.NewGuid() };

        var shipTile = _shipTileBuilder
            .WithXCoordinate(5)
            .WithYCoordinate(4)
            .WithIsDestroyed(false)
            .WithPlayerShipId(playerShip.Id)
            .WithPlayerShip(playerShip)
            .WithEngine(Engine.Petrol)
            .WithGuns(Gun.Laser)
            .WithShield(true)
            .WithGunCount(1)
            .WithIsFlagship(false)
            .Build();

        Assert.Equal(5, shipTile.XCoordinate);
        Assert.Equal(4, shipTile.YCoordinate);
        Assert.False(shipTile.IsDestroyed);
        Assert.Equal(playerShip.Id, shipTile.PlayerShipId);
        Assert.Equal(playerShip, shipTile.PlayerShip);
        Assert.Equal(Engine.Petrol, shipTile.Engine);
        Assert.Equal(Gun.Laser, shipTile.Guns);
        Assert.True(shipTile.Shield);
        Assert.Equal(1, shipTile.GunCount);
        Assert.False(shipTile.IsFlagship);
    }
}