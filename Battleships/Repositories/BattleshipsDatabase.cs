﻿using Battleships.Models;
using Battleships.Models.Ships;

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
        public IRepository<GameSession> GameSessionsRepository { get; }
        public IRepository<GameSessionSettings> GameSessionSettingsRepository { get; }
        public IRepository<Player> PlayersRepository { get; }
        public IRepository<PlayerShip> PlayerShipsRepository { get; }
        public IRepository<ShipTile> ShipTilesRepository { get; }
        public IRepository<Ship> ShipsRepository { get; }
        public IRepository<UserCosmetic> UserCosmeticsRepository { get; }
        public IRepository<Friend> FriendsRepository { get; }
    }
}