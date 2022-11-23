using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.GameSession;
using Battleships.Services.GameSession.Interfaces;
using Moq;

namespace BattleshipsUnitTests;

public class GameLaunchServiceTests
{
    private readonly GameLaunchService _gameLaunchService;
    private readonly Mock<IPlayerShipGenerationService> _playerShipGenerationServiceMock;

    private readonly Mock<IRepository<PlayerShip>> _playerShipsRepositoryMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;

    public GameLaunchServiceTests()
    {
        _playerShipsRepositoryMock = new Mock<IRepository<PlayerShip>>(); 
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        var databaseMock = GetDbMock(_playerShipsRepositoryMock, _gameSessionsRepositoryMock);
        
        _playerShipGenerationServiceMock = new Mock<IPlayerShipGenerationService>();
        
        _gameLaunchService = new GameLaunchService(
            databaseMock.Object,
            _playerShipGenerationServiceMock.Object
        );
    }

    [Fact]
    public async Task When_LaunchingGame_Expect_PlayerShipGenerationCalled()
    {
        var gameSessionId = Guid.NewGuid();
        var settings = new GameSessionSettings();
        var gameSession = new GameSession { Settings = settings };

        SetupGameSessionRepository(gameSessionId, gameSession);
        
        await _gameLaunchService.LaunchGame(gameSessionId);

        _playerShipGenerationServiceMock.Verify(s => s.GeneratePlayerShips(
            It.Is<GameSessionSettings>(expected => expected == settings)
        ));
    }
    
    [Fact]
    public async Task When_LaunchingGame_Expect_DbCalled()
    {
        var gameSessionId = Guid.NewGuid();
        var settings = new GameSessionSettings();
        var gameSession = new GameSession { Settings = settings };
        var playerShips = new List<PlayerShip>();

        SetupGameSessionRepository(gameSessionId, gameSession);
        SetupShipGenerationService(settings, playerShips);
        
        await _gameLaunchService.LaunchGame(gameSessionId);

        _playerShipsRepositoryMock.Verify(repo => repo.CreateMany(
            It.Is<List<PlayerShip>>(ships => ships == playerShips)
        ));

        _gameSessionsRepositoryMock.Verify(repo => repo.Update(
            It.Is<GameSession>(session => session.Status == GameSessionStatus.InProgress)
        ));
    }

    private void SetupGameSessionRepository(Guid gameSessionId, GameSession gameSession)
    {
        _gameSessionsRepositoryMock
            .Setup(repo => repo.GetById(It.Is<Guid>(id => id == gameSessionId)))
            .ReturnsAsync(gameSession);
    }

    private void SetupShipGenerationService(GameSessionSettings settings, List<PlayerShip> playerShips)
    {
        _playerShipGenerationServiceMock
            .Setup(s => s.GeneratePlayerShips(It.Is<GameSessionSettings>(expected => expected == settings)))
            .ReturnsAsync(playerShips);
    }

    private static Mock<IBattleshipsDatabase> GetDbMock(
        Mock<IRepository<PlayerShip>> playerShipsRepositoryMock,
        Mock<IGameSessionsRepository> gameSessionsRepositoryMock
    )
    {
        var mock = new Mock<IBattleshipsDatabase>();

        mock.Setup(db => db.PlayerShipsRepository).Returns(playerShipsRepositoryMock.Object);
        mock.Setup(db => db.GameSessionsRepository).Returns(gameSessionsRepositoryMock.Object);

        return mock;
    }
}