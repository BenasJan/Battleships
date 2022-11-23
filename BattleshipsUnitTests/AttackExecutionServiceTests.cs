using Battleships.Builders;
using Battleships.Data.Constants;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;
using Moq;

namespace BattleshipsUnitTests;

public class AttackExecutionServiceTests
{
    private readonly AttackExecutionService _attackExecutionService;

    private readonly Mock<IShipTilesRepository> _shipTilesRepositoryMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    private readonly Mock<IEndgameService> _endgameServiceMock;
    private readonly Mock<IBattleshipsSynchronizationService> _battleshipsSynchronizationServiceMock;

    public AttackExecutionServiceTests()
    {
        _shipTilesRepositoryMock = new Mock<IShipTilesRepository>();
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();

        _endgameServiceMock = new Mock<IEndgameService>();
        _battleshipsSynchronizationServiceMock = new Mock<IBattleshipsSynchronizationService>();
        
        _attackExecutionService = new AttackExecutionService(
            GetDatabaseMock(_shipTilesRepositoryMock, _gameSessionsRepositoryMock).Object,
            _endgameServiceMock.Object,
            _battleshipsSynchronizationServiceMock.Object
        );
    }
    
    [Fact]
    public async Task When_ExecutingAttack_With_TargetTileWithShip_Expect_UpdateCalled()
    {
        var targetedTile = new List<ShipTile> { new ShipTile() };
        var attack = new AttackPayload();

        SetupGetAttackedTile(targetedTile, attack);
        SetupGetGameSession(GetGameSession());

        await _attackExecutionService.ExecuteAttack(attack);

        _shipTilesRepositoryMock.Verify(
            repo => repo.UpdateMany(It.Is<List<ShipTile>>(expected => expected == targetedTile)),
            Times.Once
        );
    }
    
    [Fact]
    public async Task When_ExecutingAttack_With_TargetTileWithoutShip_Expect_UpdateNotCalled()
    {
        var targetedTile = new List<ShipTile>();
        var attack = new AttackPayload();

        SetupGetAttackedTile(targetedTile, attack);
        SetupGetGameSession(GetGameSession());

        await _attackExecutionService.ExecuteAttack(attack);

        _shipTilesRepositoryMock.Verify(
            repo => repo.Update(It.IsAny<ShipTile>()),
            Times.Never
        );
    }

    [Fact]
    public async Task When_ExecutingAttack_Expect_RoundIncremented()
    {
        var targetedTile = new List<ShipTile>();
        var attack = new AttackPayload();

        var gameSession = GetGameSession();
        gameSession.CurrentRound = 4;
        
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
        SetupGetAttackedTile(new List<ShipTile>{ new ShipTile() }, attack);
        SetupGetGameSession(GetGameSession());
        SetupEndgameReached(gameSessionId, true);

        await _attackExecutionService.ExecuteAttack(attack);

        _endgameServiceMock.Verify(service => service.EndGameSession(
            It.Is<Guid>(expected => expected == attack.GameSessionId),
            It.Is<string>(expected => expected == attack.AttackingUserId)
        ), Times.Once);
    }

    private void SetupGetAttackedTile(List<ShipTile> tiles, AttackPayload attack)
    {
        _shipTilesRepositoryMock
            .Setup(repo => repo
                .GetAttackedTiles(It.Is<AttackPayload>(expected => expected == attack))
            )
            .ReturnsAsync(tiles);
    }

    private void SetupGetGameSession(GameSession gameSession)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetWithPlayersAndSettings(It.IsAny<Guid>()))
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

    private static GameSession GetGameSession()
    {
        return new GameSession
        {
            Id = Guid.NewGuid(),
            Players = new List<Player>
            {
                new() { IsCurrentPlayerTurn = true },
                new() { IsCurrentPlayerTurn = false },
            }
        };
    }
}