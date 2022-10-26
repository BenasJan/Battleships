using Battleships.Data.Constants;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.Services.EndgameStrategies;
using Moq;

namespace BattleshipsUnitTests;

public class EndgameStrategyServiceTests
{
    private readonly EndgameStrategyService _endgameStrategyService;

    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;

    public EndgameStrategyServiceTests()
    {
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        
        var dbMock = new Mock<IBattleshipsDatabase>();
        dbMock.Setup(db => db.GameSessionsRepository).Returns(_gameSessionsRepositoryMock.Object);

        _endgameStrategyService = new EndgameStrategyService(
            dbMock.Object,
            GetEndgameStrategies()
        );
    }

    [Fact]
    public async Task When_GettingStrategy_Expect_CorrectStrategy()
    {
        var id = Guid.NewGuid();
        SetupGameSessionStrategy(id, EndgameStrategies.DeathMatch);

        var strategy = await _endgameStrategyService.GetEndgameStrategy(id);
        
        Assert.Equal(EndgameStrategies.DeathMatch, strategy.StrategyType);
    }

    private void SetupGameSessionStrategy(Guid gameSessionId, string strategyType)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetEndgameStrategy(
                It.Is<Guid>(expected => expected == gameSessionId)
            ))
            .ReturnsAsync(strategyType);
    }

    private static List<IEndgameStrategy> GetEndgameStrategies()
    {
        return new List<IEndgameStrategy>
        {
            GetStrategyMock(EndgameStrategies.Classic).Object,
            GetStrategyMock(EndgameStrategies.DestroyedShipCount).Object,
            GetStrategyMock(EndgameStrategies.RoundCountLimit).Object,
            GetStrategyMock(EndgameStrategies.DeathMatch).Object,
        };
    }

    private static Mock<IEndgameStrategy> GetStrategyMock(string strategyType)
    {
        var mock = new Mock<IEndgameStrategy>();

        mock.Setup(strategy => strategy.StrategyType).Returns(strategyType);

        return mock;
    }
}