using Battleships.Repositories;
using Moq;

namespace BattleshipsUnitTests;

public class BattleshipsDatabaseBuilder
{
    private readonly Mock<IBattleshipsDatabase> _dbMock;
    
    public BattleshipsDatabaseBuilder()
    {
        _dbMock = new Mock<IBattleshipsDatabase>();
    }

    public static BattleshipsDatabaseBuilder GetBuilder()
    {
        return new BattleshipsDatabaseBuilder();
    }

    public BattleshipsDatabaseBuilder WithGameSessionsRepo(Mock<IGameSessionsRepository> repoMock)
    {
        _dbMock.Setup(db => db.GameSessionsRepository).Returns(repoMock.Object);

        return this;
    }
    
    public BattleshipsDatabaseBuilder WithShipTilesRepo(Mock<IShipTilesRepository> repoMock)
    {
        _dbMock.Setup(db => db.ShipTilesRepository).Returns(repoMock.Object);

        return this;
    }

    public BattleshipsDatabaseBuilder WithShipsRepo(Mock<IShipsRepository> repoMock)
    {
        _dbMock.Setup(db => db.ShipsRepository).Returns(repoMock.Object);

        return this;
    }

    public Mock<IBattleshipsDatabase> Build()
    {
        return _dbMock;
    }
}