using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.SignalR.Interfaces;
using Moq;

namespace BattleshipsUnitTests;

public class EndgameServiceTests
{
    private readonly EndgameService _endgameService;

    private readonly Mock<IEndgameStrategyService> _endgameStrategyServiceMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    
    public EndgameServiceTests()
    {
        _endgameStrategyServiceMock = new Mock<IEndgameStrategyService>();
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        
        var dbMock = new Mock<IBattleshipsDatabase>();
        dbMock.Setup(db => db.GameSessionsRepository).Returns(_gameSessionsRepositoryMock.Object);

        _endgameService = new EndgameService(
            dbMock.Object,
            new Mock<IEndgameStrategyService>().Object,
            new Mock<IBattleshipsSynchronizationService>().Object
        );
    }

    [Fact]
    public async Task When_FinishingEndgame_Expect_SessionFinished()
    {
        var gameSessionId = Guid.NewGuid();
        var attackerId = Guid.NewGuid().ToString();
        var session = new GameSession{ Id = gameSessionId };
        
        SetupGameSession(session, gameSessionId);

        await _endgameService.EndGameSession(gameSessionId, attackerId);

        _gameSessionsRepositoryMock.Verify(repo => repo.Update(
            It.Is<GameSession>(expected => expected.Status == GameSessionStatus.EndgameReached && expected.WinnerId == attackerId)
        ));
    }

    private void SetupGameSession(GameSession gameSession, Guid gameSessionId)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetById(It.Is<Guid>(expected => expected == gameSessionId)))
            .ReturnsAsync(gameSession);
    }
}