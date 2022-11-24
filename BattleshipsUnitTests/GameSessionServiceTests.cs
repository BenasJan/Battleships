using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Facades;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession;
using Battleships.Services.GameSession.Interfaces;
using Moq;

namespace BattleshipsUnitTests;

public class GameSessionServiceTests
{
    private readonly GameSessionService _gameSessionService;
    private readonly Mock<IRepository<PlayerShip>> _playerShipRepository;
    private readonly Mock<IShipTilesRepository> _shipTileRepository;
    private readonly Mock<IGameSessionFacade> _gameSessionsFacadeMock;
    private readonly Mock<IGameSessionsRepository> _gameSessionsRepositoryMock;
    private readonly Mock<IInGameSessionHelperService> _inGameSessionMock;

    public GameSessionServiceTests()
    {
        _gameSessionsRepositoryMock = new Mock<IGameSessionsRepository>();
        var currentUserServiceMock = new Mock<ICurrentUserService>();
        _gameSessionsFacadeMock = new Mock<IGameSessionFacade>();
        _shipTileRepository = new Mock<IShipTilesRepository>();
        _playerShipRepository = new Mock<IRepository<PlayerShip>>();
        _inGameSessionMock = new Mock<IInGameSessionHelperService>();

        var databaseMock = GetDbMock(_gameSessionsRepositoryMock, _playerShipRepository, _shipTileRepository);
        
        _gameSessionService = new GameSessionService(
            databaseMock.Object,
            currentUserServiceMock.Object,
            _inGameSessionMock.Object
        );
    }

    [Fact]
    public async Task When_CreatingGame_Expect_NewGuid()
    {
        var gameSessionDto = new GameSessionRequestDto
        {
            Icon = "",
            Name = "",
            SettingsDto = new GameSessionSettingsDto()
        };
        
        var expected = Guid.Parse("00000000-0000-0000-0000-000000000000");
        var actual = await _gameSessionService.CreateSession(gameSessionDto);
     
        Assert.Equal(expected, actual);
    }
    
    [Fact]
    public async Task When_GettingAllSessions_Expect_OneElementList()
    {
        SetupGameSessionRepositoryGetAll(_gameSessionsRepositoryMock);

        var actual = await _gameSessionService.ListAllSessions();
        
        Assert.Single(actual);
    }
    
    [Fact]
    public async Task When_GettingSession_Expect_RepositoryGetDtoWithPlayerCall()
    {
        var guid = Guid.NewGuid();
        
        await _gameSessionService.GetSession(guid);
        
        _gameSessionsRepositoryMock.Verify(s => s.GetDtoWithPlayers(
            It.Is<Guid>(expected => expected == guid)
            ));
    }
    
    [Fact]
    public async Task When_GettingInGameSession_Expect_RepositoryMethodsCall()
    {
        var guid = Guid.NewGuid();
        
        await _gameSessionService.GetSession(guid);
        
        _gameSessionsRepositoryMock.Verify(s => s.GetDtoWithPlayers(
            It.Is<Guid>(expected => expected == guid)
        ));
    }
    
    [Fact]
    public async Task When_GettingGameSessionById_Expect_GameSessionDto()
    {
        var guid = Guid.NewGuid();
        SetupGameSessionRepositoryGetDtoWithPlayers(_gameSessionsRepositoryMock, guid);
        
        var actual = await _gameSessionService.GetSession(guid);
        
        Assert.Equal(actual.Id, guid);
    }
    
    [Fact]
    public void When_GettingTilesDtoWithRowsAndColumnsCount_Expect_RowsXColumnsGameTilesCount()
    {
        var rows = 10;
        var columns = 8;
        
        var actual = _gameSessionService.GetTileDtos(new List<ShipTile>(), columns, rows);
        
        Assert.Equal(actual.Count, rows * columns);
    }
    
    [Fact]
    public async Task When_MoveShipInSession_Expect_ShipDirectionChange()
    {
        var shipTiles = new List<ShipTile>();
        var playerId = Guid.NewGuid();
        var gameSessionId = Guid.NewGuid();
        var shipId = Guid.NewGuid();
        for (int i = 1; i <= 10; i++)
        {
            shipTiles.Add(new ShipTile{XCoordinate = i});
        }
        var shipTilesAfterChange = new List<GameTile>();
        for (int i = 1; i <= 10; i++)
        {
            shipTilesAfterChange.Add(new GameTile(){ColumnCoordinate = i - 1});
        }
        var playerShip = new PlayerShip
        {
            Id = playerId,
            Tiles = shipTiles
        };
        SetupPlayerShipAndShipTile(playerShip, shipTiles, shipTilesAfterChange);
        
        var actual =  await _gameSessionService.MoveShipInSession(gameSessionId, shipId, "Up");
        
        Assert.Equal(actual.OwnTiles, shipTilesAfterChange);
    }
    
    private void SetupPlayerShipAndShipTile(PlayerShip playerShip, List<ShipTile> tiles, List<GameTile> gameTiles)
    {
        _playerShipRepository
            .Setup(s => s.GetById(It.IsAny<Guid>()))
            .ReturnsAsync(playerShip);
        
        _shipTileRepository
            .Setup(s => s.GetPlayerTiles(playerShip.PlayerId))
            .ReturnsAsync(tiles);

        _inGameSessionMock
            .Setup(s => s.GetInGameSession(It.IsAny<Guid>()))
            .ReturnsAsync(new InGameSessionDto()
            {
                OwnTiles = gameTiles
            });
        
        _inGameSessionMock
            .Setup(s => s.GetTileDtos(
                It.IsAny<List<ShipTile>>(), It.IsAny<int>(), It.IsAny<int>()))
            .Returns(gameTiles);
    }
    
    private void SetupGameSessionFacade(Guid guid)
    {
        _gameSessionsFacadeMock
            .Setup(s => s.CreateGameSession())
            .ReturnsAsync(guid);
    }
    
    private static void SetupGameSessionRepositoryGetAll(Mock<IGameSessionsRepository> repository)
    {
        repository.Setup(db => db.GetAll())
            .ReturnsAsync(new List<GameSession>
            {
                new GameSession()
                {
                    Players = new List<Player>()
                    {
                        new Player()
                        {
                            Id = Guid.NewGuid(),
                            User = new ApplicationUser()
                            {
                                Name = "aboba"
                            },
                            UserId = "aboba2"
                        }
                    },
                    Settings = new GameSessionSettings()
                }
            });
    }
    
    private static void SetupGameSessionRepositoryGetDtoWithPlayers(Mock<IGameSessionsRepository> repository, Guid guid)
    {
        repository.Setup(db => db.GetDtoWithPlayers(guid))
            .ReturnsAsync(new GameSessionDto(){Id = guid});
    }
    
    private static Mock<IBattleshipsDatabase> GetDbMock(
        Mock<IGameSessionsRepository> gameSessionsRepositoryMock,
        Mock<IRepository<PlayerShip>> playerShipRepositoryMock,
        Mock<IShipTilesRepository> shipTileRepositoryMock
    )
    {
        var mock = new Mock<IBattleshipsDatabase>();

        mock.Setup(db => db.GameSessionsRepository).Returns(gameSessionsRepositoryMock.Object);
        mock.Setup(db => db.PlayerShipsRepository).Returns(playerShipRepositoryMock.Object);
        mock.Setup(db => db.ShipTilesRepository).Returns(shipTileRepositoryMock.Object);

        return mock;
    }
}