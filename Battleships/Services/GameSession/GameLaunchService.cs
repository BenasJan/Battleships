﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession.Interfaces;
using Battleships.SignalR.Interfaces;

namespace Battleships.Services.GameSession;

public class GameLaunchService : IGameLaunchService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;
    private readonly ICurrentUserService _currentUserService;

    private readonly NumberGeneratorFactory _numberGeneratorFactory;

    public GameLaunchService(
        IBattleshipsDatabase battleshipsDatabase,
        IBattleshipsSynchronizationService battleshipsSynchronizationService,
        ICurrentUserService currentUserService
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _battleshipsSynchronizationService = battleshipsSynchronizationService;
        _currentUserService = currentUserService;

        _numberGeneratorFactory = new NumberGeneratorFactory();
    }

    public async Task LaunchGame(Guid gameSessionId)
    {
        var currentUserId = _currentUserService.GetCurrentUserId();
        var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);
        var (ownPlayerId, opponentPlayerId) =
            await _battleshipsDatabase.GameSessionsRepository.GetPlayerIds(gameSessionId, currentUserId);

        var playerShips = Enumerable.Empty<PlayerShip>()
            .Concat(await GenerateShips(ownPlayerId, gameSession.Settings))
            .Concat(await GenerateShips(opponentPlayerId, gameSession.Settings))
            .ToList();

        gameSession.Status = GameSessionStatus.InProgress;

        await _battleshipsDatabase.PlayerShipsRepository.CreateMany(playerShips);
        await _battleshipsDatabase.GameSessionsRepository.Update(gameSession);
        
        await _battleshipsSynchronizationService.SendLaunchGameMessage(gameSessionId);
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

            var direction = row < rowCount / 2 ? "up" : "down";
            var shipTypeTuple = shipTypeTuples[playerShips.Count];

            var shipTiles = Enumerable.Range(row, shipTypeTuple.Item2).Select(rawRowNumber =>
            {
                var rowNumber = direction == "up" ? rawRowNumber : row - (rawRowNumber - row);

                return new ShipTile
                {
                    XCoordinate = column,
                    YCoordinate = rowNumber
                };
            }).ToList();

            var ship = await _battleshipsDatabase.ShipsRepository.GetByType(shipTypeTuple.Item1);

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