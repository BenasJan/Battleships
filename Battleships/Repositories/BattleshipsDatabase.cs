using Battleships.Models;

namespace Battleships.Repositories
{
    public class BattleshipsDatabase : IBattleshipsDatabase
    {
        public BattleshipsDatabase(
            IRepository<Achievement> achievementsRepository,
            IGameSessionsRepository gameSessionsRepository,
            IGameSessionSettingsRepository gameSessionSettingsRepository,
            IPlayersRepository playersRepository,
            IRepository<PlayerShip> playerShipsRepository,
            IShipsRepository shipsRepository,
            IRepository<UserCosmetic> userCosmeticsRepository,
            IShipTilesRepository shipTilesRepository,
            IRepository<Friend> friendsRepository)
        {
            AchievementsRepository = achievementsRepository;
            GameSessionsRepository = gameSessionsRepository;
            GameSessionSettingsRepository = gameSessionSettingsRepository;
            PlayersRepository = playersRepository;
            PlayerShipsRepository = playerShipsRepository;
            ShipsRepository = shipsRepository;
            UserCosmeticsRepository = userCosmeticsRepository;
            ShipTilesRepository = shipTilesRepository;
            FriendsRepository = friendsRepository;
        }

        public IRepository<Achievement> AchievementsRepository { get; }
        public IGameSessionsRepository GameSessionsRepository { get; }
        public IGameSessionSettingsRepository GameSessionSettingsRepository { get; }
        public IPlayersRepository PlayersRepository { get; }
        public IRepository<PlayerShip> PlayerShipsRepository { get; }
        public IShipTilesRepository ShipTilesRepository { get; }
        public IShipsRepository ShipsRepository { get; }
        public IRepository<UserCosmetic> UserCosmeticsRepository { get; }
        public IRepository<Friend> FriendsRepository { get; }
    }
}