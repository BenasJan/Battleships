using Battleships.Models;

namespace Battleships.Repositories
{
    public class BattleshipsDatabase : IBattleshipsDatabase
    {
        public BattleshipsDatabase(
            IRepository<Achievement> achievementsRepository,
            IRepository<GameSession> gameSessionsRepository,
            IRepository<GameSessionSettings> gameSessionSettingsRepository,
            IRepository<Player> playersRepository,
            IRepository<PlayerShip> playerShipsRepository,
            IRepository<Ship> shipsRepository,
            IRepository<UserCosmetic> userCosmeticsRepository,
            IRepository<ShipTile> shipTilesRepository)
        {
            AchievementsRepository = achievementsRepository;
            GameSessionsRepository = gameSessionsRepository;
            GameSessionSettingsRepository = gameSessionSettingsRepository;
            PlayersRepository = playersRepository;
            PlayerShipsRepository = playerShipsRepository;
            ShipsRepository = shipsRepository;
            UserCosmeticsRepository = userCosmeticsRepository;
            ShipTilesRepository = shipTilesRepository;
        }

        public IRepository<Achievement> AchievementsRepository { get; }
        public IRepository<GameSession> GameSessionsRepository { get; }
        public IRepository<GameSessionSettings> GameSessionSettingsRepository { get; }
        public IRepository<Player> PlayersRepository { get; }
        public IRepository<PlayerShip> PlayerShipsRepository { get; }
        public IRepository<ShipTile> ShipTilesRepository { get; }
        public IRepository<Ship> ShipsRepository { get; }
        public IRepository<UserCosmetic> UserCosmeticsRepository { get; }
    }
}