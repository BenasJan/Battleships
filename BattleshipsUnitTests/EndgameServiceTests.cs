using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.Services.Users;
using Battleships.SignalR.Interfaces;
using Moq;

namespace BattleshipsUnitTests;

public class EndgameServiceTests
{
    private readonly EndgameService _endgameService;

    private readonly Mock<IEndgameStrategyService> _endgameStrategyServiceMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    private readonly Mock<IUserManager> _userManagerMock;
    private readonly Mock<IBattleshipsSynchronizationService> _battleshipsSynchronizationServiceMock;
    
    public EndgameServiceTests()
    {
        _endgameStrategyServiceMock = new Mock<IEndgameStrategyService>();
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        _userManagerMock = new Mock<IUserManager>();
        _battleshipsSynchronizationServiceMock = new Mock<IBattleshipsSynchronizationService>();
        
        var dbMock = new Mock<IBattleshipsDatabase>();
        dbMock.Setup(db => db.GameSessionsRepository).Returns(_gameSessionsRepositoryMock.Object);

        _endgameService = new EndgameService(
            dbMock.Object,
            new Mock<IEndgameStrategyService>().Object,
            _battleshipsSynchronizationServiceMock.Object,
            _userManagerMock.Object
        );
    }

    [Fact]
    public async Task When_FinishingEndgame_Expect_SessionFinished()
    {
        var gameSessionId = Guid.NewGuid();
        var attackerId = Guid.NewGuid().ToString();
        var session = new GameSession{ Id = gameSessionId };
        
        SetupGameSession(session, gameSessionId);
        SetupUserManager(attackerId, "winner");

        await _endgameService.EndGameSession(gameSessionId, attackerId);

        _gameSessionsRepositoryMock.Verify(repo => repo.Update(
            It.Is<GameSession>(expected => expected.Status == GameSessionStatus.EndgameReached && expected.WinnerId == attackerId)
        ));
        _battleshipsSynchronizationServiceMock.Verify(s => s.SendEndgameReached(
            It.Is<Guid>(id => id == gameSessionId),
            It.Is<string>(winner => winner == "winner")
        ));
    }

    private void SetupGameSession(GameSession gameSession, Guid gameSessionId)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetById(It.Is<Guid>(expected => expected == gameSessionId)))
            .ReturnsAsync(gameSession);
    }

    private void SetupUserManager(string attackerId, string winnerName)
    {
        _userManagerMock.Setup(um => um.GetById(It.Is<string>(id => id == attackerId)))
            .ReturnsAsync(new ApplicationUser { UserName = winnerName });
    }
}