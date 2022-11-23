using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Builders;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class PlayerShipGenerationService : IPlayerShipGenerationService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly ICurrentUserService _currentUserService;
        private readonly NumberGeneratorFactory _numberGeneratorFactory;

        public PlayerShipGenerationService(
            IBattleshipsDatabase battleshipsDatabase,
            ICurrentUserService currentUserService,
            NumberGeneratorFactory numberGeneratorFactory)
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = currentUserService;
            _numberGeneratorFactory = numberGeneratorFactory;
        }

        public async Task<List<PlayerShip>> GeneratePlayerShips(GameSessionSettings settings)
        {
            var currentUserId = _currentUserService.GetCurrentUserId();
            var (ownPlayerId, opponentPlayerId) =
                await _battleshipsDatabase.GameSessionsRepository.GetPlayerIds(settings.GameSessionId, currentUserId);

            var playerShips = Enumerable.Empty<PlayerShip>()
                .Concat(await GenerateShips(ownPlayerId, settings))
                .Concat(await GenerateShips(opponentPlayerId, settings))
                .ToList();

            return playerShips;
        }

        private async Task<List<PlayerShip>> GenerateShips(Guid playerId, GameSessionSettings settings)
        {
            var columnCount = settings.ColumnCount;
            var rowCount = settings.RowCount;

            var rowStartGenerator = _numberGeneratorFactory.GetNumberGenerator(rowCount);
            var columnStartGenerator = _numberGeneratorFactory.GetNumberGenerator(columnCount);

            var shipTypeTuples = new List<(string, int)>()
        {
            (ShipTypes.Carrier, 5),
            (ShipTypes.Battleship, 4),
            (ShipTypes.Cruiser, 3),
            (ShipTypes.Destroyer, 2),
            (ShipTypes.Destroyer, 2),
            (ShipTypes.Submarine, 1),
            (ShipTypes.Submarine, 1)
        };

            var playerShips = new List<PlayerShip>();

            while (playerShips.Count < 7)
            {
                var column = columnStartGenerator.GenerateNumber();

                if (playerShips.Any(ship => ship.Tiles.Any(tile => tile.XCoordinate == column)))
                {
                    continue;
                }

                var row = rowStartGenerator.GenerateNumber();

                var direction = row < (rowCount / 2) ? "down" : "up";
                var (shipType, shipSize) = shipTypeTuples[playerShips.Count];

                var shipTiles = Enumerable.Range(row, shipSize).Select(rawRowNumber =>
                {
                    var rowNumber = direction == "down" ? rawRowNumber : row - (rawRowNumber - row);

                    return new ShipTileBuilder()
                        .WithXCoordinate(column)
                        .WithYCoordinate(rowNumber)
                        .Build();

                }).ToList();

                var ship = await _battleshipsDatabase.ShipsRepository.GetByType(shipType);

                var playerShip = new PlayerShip
                {
                    PlayerId = playerId,
                    Tiles = shipTiles,
                    ShipId = ship.Id
                };

                playerShips.Add(playerShip);
            }

            return playerShips;
        }
    }
}

