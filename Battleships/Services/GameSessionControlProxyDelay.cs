using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class GameSessionControlProxyDelay : IGameSessionControl
{
    private readonly IGameSessionControl _gameSessionControl;
    private readonly IBattleshipsDatabase _battleshipsDatabase;

    public GameSessionControlProxyDelay(
        IGameSessionControl gameSessionControl,
        IBattleshipsDatabase battleshipsDatabase
    )
    {
        _gameSessionControl = gameSessionControl;
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task ExecuteAttack(AttackEvent attackEvent)
    {
        Thread.Sleep(5000);
        await _gameSessionControl.ExecuteAttack(attackEvent);
    }

    public async Task MoveShip(MoveShipEvent moveShipEvent)
    {
        Thread.Sleep(5000);
        await _gameSessionControl.MoveShip(moveShipEvent);
    }
}