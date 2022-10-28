using Battleships.Models;
using Battleships.Models.Ships;

namespace Battleships.Repositories
{
    public interface IBattleshipsDatabase
    {
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