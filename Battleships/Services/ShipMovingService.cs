using System;
using System.Threading.Tasks;
using Battleships.Data.Constants;
using Battleships.Models.Ships;
using Battleships.Repositories;
using Battleships.Services.TemplateMethod;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class ShipMovingService : IShipMovingService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private BaseShipMover _shipMover;

    public ShipMovingService(IBattleshipsDatabase battleshipsDatabase)
    {
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task MoveShip(MoveShipEvent moveShipEvent)
    {
        var playerShip = await _battleshipsDatabase.PlayerShipsRepository.GetById(moveShipEvent.PlayerShipId);
        var gameSession = await _battleshipsDatabase.GameSessionsRepository.GetById(moveShipEvent.GameSessionId);
        _shipMover = GetShipMover(playerShip.Ship);

        var updatedPlayerShip = _shipMover.MoveShip(
            playerShip, moveShipEvent.Direction,
            gameSession.Settings.ColumnCount, gameSession.Settings.RowCount
        );

        await _battleshipsDatabase.PlayerShipsRepository.Update(updatedPlayerShip);
    }

    private static BaseShipMover GetShipMover(Ship ship)
    {
        return ship.ShipType switch
        {
            ShipTypes.Carrier => new CarrierShipMover(),
            ShipTypes.Battleship => new BattleshipShipMover(),
            ShipTypes.Cruiser => new CruiserShipMover(),
            ShipTypes.Submarine => new SubmarineShipMover(),
            ShipTypes.Destroyer => new DestroyerShipMover(),
            _ => throw new ArgumentException(nameof(ship.ShipType))
        };
    }
}