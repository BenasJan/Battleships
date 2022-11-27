using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Models.Ships;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession;
using Moq;

namespace BattleshipsUnitTests;

public class PlayerShipGenerationServiceTests
{
    private readonly PlayerShipGenerationService _playerShipGenerationService;

    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock = new();
    private readonly Mock<IShipsRepository> _shipsRepositoryMock = new();
    private readonly Mock<ICurrentUserService> _currentUserServiceMock = new();

    public PlayerShipGenerationServiceTests()
    {
        var dbMock = BattleshipsDatabaseBuilder.GetBuilder()
            .WithGameSessionsRepo(_gameSessionsRepositoryMock)
            .WithShipsRepo(_shipsRepositoryMock)
            .Build();
        
        _playerShipGenerationService = new PlayerShipGenerationService(
            dbMock.Object,
            _currentUserServiceMock.Object,
            new NumberGeneratorFactory()
        );
    }

    [Theory]
    [InlineData(12, 12)]
    [InlineData(15, 20)]
    [InlineData(25, 30)]
    [InlineData(40, 40)]
    public async Task When_GeneratingShips_Expect_ShipsGenerated(int columnCount, int rowCount)
    {
        const int shipCountPerPlayer = 7;
        const int tileCountPerPlayer = 18;
        var currentPlayerId = Guid.NewGuid();
        var opponentPlayerId = Guid.NewGuid();
        var currentUserId = Guid.NewGuid().ToString();
        var gameSessionId = Guid.NewGuid();
        var settings = new GameSessionSettings
        {
            ColumnCount = columnCount,
            RowCount = rowCount,
            GameSessionId = gameSessionId
        };

        SetupCurrentUserService(currentUserId);
        SetupGameSessionRepository(gameSessionId, currentUserId, currentPlayerId, opponentPlayerId);
        SetupShipsRepository();

        var ships = await _playerShipGenerationService.GeneratePlayerShips(settings);
        
        var currentPlayerShips = ships.Where(ship => ship.PlayerId == currentPlayerId).ToList();
        var opponentPlayerShips = ships.Where(ship => ship.PlayerId == opponentPlayerId).ToList();
        
        Assert.Equal(shipCountPerPlayer, currentPlayerShips.Count);
        Assert.Equal(tileCountPerPlayer, GetTileCount(currentPlayerShips));
        Assert.Equal(shipCountPerPlayer, opponentPlayerShips.Count);
        Assert.Equal(tileCountPerPlayer, GetTileCount(opponentPlayerShips));
    }

    private void SetupCurrentUserService(string currentUserId)
    {
        _currentUserServiceMock.Setup(s => s.GetCurrentUserId()).Returns(currentUserId);
    }

    private void SetupGameSessionRepository(Guid gameSessionId, string currentUserId, Guid currentPlayerId,
        Guid opponentPlayerId)
    {
        _gameSessionsRepositoryMock
            .Setup(s => s.GetPlayerIds(
                It.Is<Guid>(id => id == gameSessionId),
                It.Is<string>(id => id == currentUserId)
            ))
            .ReturnsAsync((currentPlayerId, opponentPlayerId));
    }

    private void SetupShipsRepository()
    {
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Carrier)))
            .ReturnsAsync(new CarrierShip());
        
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Battleship)))
            .ReturnsAsync(new BattleshipShip());
        
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Cruiser)))
            .ReturnsAsync(new CruiserShip());
        
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Submarine)))
            .ReturnsAsync(new SubmarineShip());
        
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Destroyer)))
            .ReturnsAsync(new DestroyerShip());
        
        _shipsRepositoryMock
            .Setup(repo => repo.GetByType(It.Is<string>(type => type == ShipTypes.Dummy)))
            .ReturnsAsync(new DummyShip());
    }

    private static int GetTileCount(IEnumerable<PlayerShip> ships)
    {
        return ships.Select(ship => ship.Tiles.Count).Sum();
    }
}