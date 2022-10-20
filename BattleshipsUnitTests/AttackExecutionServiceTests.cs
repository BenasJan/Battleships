using Battleships.Models;
using Battleships.Models.Ships;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.SignalR.Models;
using Moq;

namespace BattleshipsUnitTests;

public class AttackExecutionServiceTests
{
    private readonly AttackExecutionService _attackExecutionService;

    private readonly Mock<IShipTilesRepository> _shipTilesRepositoryMock;

    public AttackExecutionServiceTests()
    {
        _shipTilesRepositoryMock = new Mock<IShipTilesRepository>();

        _attackExecutionService = new AttackExecutionService(
            GetDatabaseMock(_shipTilesRepositoryMock).Object
        );
    }
    
    [Fact]
    public async Task When_ExecutingAttack_With_TargetTileWithShip_Expect_UpdateCalled()
    {
        var targetedTile = new ShipTile();
        var attack = new AttackPayload();

        SetupGetAttackedTile(targetedTile, attack);

        await _attackExecutionService.ExecuteAttack(attack);

        _shipTilesRepositoryMock.Verify(
            repo => repo.Update(It.Is<ShipTile>(expected => expected == targetedTile)),
            Times.Once
        );
    }
    
    [Fact]
    public async Task When_ExecutingAttack_With_TargetTileWithoutShip_Expect_UpdateNotCalled()
    {
        ShipTile targetedTile = null;
        var attack = new AttackPayload();

        SetupGetAttackedTile(targetedTile, attack);

        await _attackExecutionService.ExecuteAttack(attack);

        _shipTilesRepositoryMock.Verify(
            repo => repo.Update(It.IsAny<ShipTile>()),
            Times.Never
        );
    }

    private void SetupGetAttackedTile(ShipTile tile, AttackPayload attack)
    {
        _shipTilesRepositoryMock
            .Setup(repo => repo
                .GetAttackedTile(It.Is<AttackPayload>(expected => expected == attack))
            )
            .ReturnsAsync(tile);
    }

    private static Mock<IBattleshipsDatabase> GetDatabaseMock(Mock<IShipTilesRepository> shipTilesRepositoryMock)
    {
        var mock = new Mock<IBattleshipsDatabase>();

        mock.Setup(m => m.ShipTilesRepository).Returns(shipTilesRepositoryMock.Object);

        return mock;
    }
}