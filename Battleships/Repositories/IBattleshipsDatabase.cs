using Battleships.Models;

namespace Battleships.Repositories
{
    public interface IBattleshipsDatabase
    {
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