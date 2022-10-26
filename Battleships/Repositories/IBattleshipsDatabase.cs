using Battleships.Models;
using Battleships.Models.Ships;

namespace Battleships.Repositories
{
    public interface IBattleshipsDatabase
    {
        public IRepository<Achievement> AchievementsRepository { get; }
        public IGameSessionsRepository GameSessionsRepository { get; }
        public IGameSessionSettingsRepository GameSessionSettingsRepository { get; }
        public IRepository<Player> PlayersRepository { get; }
        public IRepository<PlayerShip> PlayerShipsRepository { get; }
        public IShipTilesRepository ShipTilesRepository { get; }
        public IRepository<Ship> ShipsRepository { get; }
        public IRepository<UserCosmetic> UserCosmeticsRepository { get; }
    }
}