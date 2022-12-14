using Battleships.Data.Dto.InGameSession;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession;
using Moq;

namespace BattleshipsUnitTests;

public class InGameSessionHelperServiceTests
{
    private readonly InGameSessionHelperService _inGameSessionHelperService;

    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    private readonly Mock<IShipTilesRepository> _shipTilesRepositoryMock;
    private readonly Mock<ICurrentUserService> _currentUserServiceMock;


    public InGameSessionHelperServiceTests()
    {
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        _shipTilesRepositoryMock = new Mock<IShipTilesRepository>();
        
        _currentUserServiceMock = new Mock<ICurrentUserService>();

        var dbMock = BattleshipsDatabaseBuilder.GetBuilder()
            .WithGameSessionsRepo(_gameSessionsRepositoryMock)
            .WithShipTilesRepo(_shipTilesRepositoryMock)
            .Build();

        _inGameSessionHelperService = new InGameSessionHelperService(
            dbMock.Object,
            _currentUserServiceMock.Object
        );
    }

    [Fact]
    public async Task When_GettingInGameSession_Expect_CorrectSession()
    {
        var currentUserId = Guid.NewGuid().ToString();
        var currentPlayerId = Guid.NewGuid();
        var opponentPlayerId = Guid.NewGuid();
        var gameSessionId = Guid.NewGuid();
        var gameSessionDto = new InGameSessionDto
        {
            ColumnCount = 3,
            RowCount = 3,
            CurrentRound = 69
        };
        var shipTiles = GetShipTiles();

        SetupCurrentUserService(currentUserId);
        SetupGameSessionsRepositoryGetPlayerIds(gameSessionId, currentUserId, currentPlayerId, opponentPlayerId);
        SetupGameSessionsRepositoryGetInGameSession(gameSessionId, currentUserId, gameSessionDto);
        SetupShipTiles(shipTiles);
        
        var session = await _inGameSessionHelperService.GetInGameSession(gameSessionId);
        
        Assert.Equal(9, session.OwnTiles.Count);
        Assert.Equal(9, session.OpponentTiles.Count);
        Assert.Equal(69, session.CurrentRound);
    }

    private void SetupCurrentUserService(string currentUserId)
    {
        _currentUserServiceMock.Setup(s => s.GetCurrentUserId()).Returns(currentUserId);
    }

    private void SetupGameSessionsRepositoryGetPlayerIds(Guid gameSessionId, string currentUserId, Guid currentPlayerId,
        Guid opponentPlayerId)
    {
        _gameSessionsRepositoryMock.Setup(s => s.GetPlayerIds(
            It.Is<Guid>(id => id == gameSessionId),
            It.Is<string>(id => id == currentUserId))
        ).ReturnsAsync((currentPlayerId, opponentPlayerId));
    }

    private void SetupGameSessionsRepositoryGetInGameSession(Guid gameSessionId, string currentUserId, InGameSessionDto gameSessionDto)
    {
        _gameSessionsRepositoryMock.Setup(s => s.GetInGameSession(
            It.Is<Guid>(id => id == gameSessionId),
            It.Is<string>(id => id == currentUserId))
        ).ReturnsAsync(
            gameSessionDto
        );
    }

    private void SetupShipTiles(List<ShipTile> shipTiles)
    {
        _shipTilesRepositoryMock.Setup(s => s.GetPlayerTiles(It.IsAny<Guid>())).ReturnsAsync(
            shipTiles
        );
    }

    private static List<ShipTile> GetShipTiles()
    {
        return new List<ShipTile>
        {
            new() { XCoordinate = 1, YCoordinate = 1 },
            new() { XCoordinate = 2, YCoordinate = 1 },
            new() { XCoordinate = 3, YCoordinate = 1 },
            new() { XCoordinate = 1, YCoordinate = 2 },
            new() { XCoordinate = 2, YCoordinate = 2 },
            new() { XCoordinate = 3, YCoordinate = 2 },
            new() { XCoordinate = 1, YCoordinate = 3 },
            new() { XCoordinate = 2, YCoordinate = 3 },
            new() { XCoordinate = 3, YCoordinate = 3 },
        };
    }
}