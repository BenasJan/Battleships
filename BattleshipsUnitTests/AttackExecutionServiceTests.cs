using Battleships.Builders;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.SignalR.Models;
using Moq;

namespace BattleshipsUnitTests;

public class AttackExecutionServiceTests
{
    private readonly AttackExecutionService _attackExecutionService;

    private readonly Mock<IShipTilesRepository> _shipTilesRepositoryMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    private readonly Mock<IEndgameService> _endgameServiceMock;

    public AttackExecutionServiceTests()
    {
        _shipTilesRepositoryMock = new Mock<IShipTilesRepository>();
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();

        _endgameServiceMock = new Mock<IEndgameService>();
        
        _attackExecutionService = new AttackExecutionService(
            GetDatabaseMock(_shipTilesRepositoryMock, _gameSessionsRepositoryMock).Object,
            _endgameServiceMock.Object
        );
    }
    
    [Fact]
    public async Task When_ExecutingAttack_With_TargetTileWithShip_Expect_UpdateCalled()
    {
        var targetedTile = new ShipTile();
        var attack = new AttackPayload();

        SetupGetAttackedTile(targetedTile, attack);
        SetupGetGameSession(new GameSession());

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
        SetupGetGameSession(new GameSession());

        await _attackExecutionService.ExecuteAttack(attack);

        _shipTilesRepositoryMock.Verify(
            repo => repo.Update(It.IsAny<ShipTile>()),
            Times.Never
        );
    }

    [Fact]
    public async Task When_ExecutingAttack_Expect_RoundIncremented()
    {
        ShipTile targetedTile = null;
        var attack = new AttackPayload();
        // var gameSession = new GameSession{ CurrentRound = 4 };
        var gameSession = new GameSessionBuilder()
            .WithCurrentRound(4)
            .Build();
        
        SetupGetAttackedTile(targetedTile, attack);
        SetupGetGameSession(gameSession);

        await _attackExecutionService.ExecuteAttack(attack);

        _gameSessionsRepositoryMock.Verify(repo => repo.Update(
                It.Is<GameSession>(expected => expected.CurrentRound == 5)),
            Times.Once
        );
    }

    [Fact]
    public async Task When_ExecutingAttack_WithFinishedSession_Expect_EndgameServiceCalled()
    {
        var gameSessionId = Guid.NewGuid();
        var attackerId = Guid.NewGuid().ToString();
        var attack = new AttackPayload{ GameSessionId = gameSessionId, AttackingUserId = attackerId };
        SetupGetAttackedTile(new ShipTile(), attack);
        SetupGetGameSession(new GameSession());
        SetupEndgameReached(gameSessionId, true);

        await _attackExecutionService.ExecuteAttack(attack);

        _endgameServiceMock.Verify(service => service.EndGameSession(
            It.Is<Guid>(expected => expected == attack.GameSessionId),
            It.Is<string>(expected => expected == attack.AttackingUserId)
        ), Times.Once);
    }

    private void SetupGetAttackedTile(ShipTile tile, AttackPayload attack)
    {
        _shipTilesRepositoryMock
            .Setup(repo => repo
                .GetAttackedTile(It.Is<AttackPayload>(expected => expected == attack))
            )
            .ReturnsAsync(tile);
    }

    private void SetupGetGameSession(GameSession gameSession)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetById(It.IsAny<Guid>()))
            .ReturnsAsync(gameSession);
    }

    private void SetupEndgameReached(Guid gameSessionId, bool reached)
    {
        _endgameServiceMock.Setup(service => service.IsEndgameReached(
            It.Is<Guid>(expected => expected == gameSessionId)
            )
        ).ReturnsAsync(reached);
    }

    private static Mock<IBattleshipsDatabase> GetDatabaseMock(
        Mock<IShipTilesRepository> shipTilesRepositoryMock,
        Mock<IGameSessionsRepository> gameSessionsRepositoryMock
    )
    {
        var mock = new Mock<IBattleshipsDatabase>();

        mock.Setup(m => m.ShipTilesRepository).Returns(shipTilesRepositoryMock.Object);
        mock.Setup(m => m.GameSessionsRepository).Returns(gameSessionsRepositoryMock.Object);

        return mock;
    }
}