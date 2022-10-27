using Battleships.Models;
using Battleships.Models.Ships;

namespace Battleships.Repositories
{
    public class BattleshipsDatabase : IBattleshipsDatabase
    {
        public BattleshipsDatabase(
            IRepository<Achievement> achievementsRepository,
            IGameSessionsRepository gameSessionsRepository,
            IGameSessionSettingsRepository gameSessionSettingsRepository,
            IRepository<Player> playersRepository,
            IRepository<PlayerShip> playerShipsRepository,
            IRepository<Ship> shipsRepository,
            IRepository<UserCosmetic> userCosmeticsRepository,
            IRepository<ShipTile> shipTilesRepository,
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
        public IRepository<Player> PlayersRepository { get; }
        public IRepository<PlayerShip> PlayerShipsRepository { get; }
        public IShipTilesRepository ShipTilesRepository { get; }
        public IRepository<Ship> ShipsRepository { get; }
        public IRepository<UserCosmetic> UserCosmeticsRepository { get; }
        public IRepository<Friend> FriendsRepository { get; }
    }
}