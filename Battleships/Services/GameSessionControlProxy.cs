using System;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Repositories;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public class GameSessionControlProxy : IGameSessionControl
{
    private readonly IGameSessionControl _gameSessionControl;
    private readonly IBattleshipsDatabase _battleshipsDatabase;

    public GameSessionControlProxy(
        IGameSessionControl gameSessionControl,
        IBattleshipsDatabase battleshipsDatabase
    )
    {
        _gameSessionControl = gameSessionControl;
        _battleshipsDatabase = battleshipsDatabase;
    }

    public async Task ExecuteAttack(AttackEvent attackEvent)
    {
        if (await IsControlAllowed(attackEvent))
        {
            await _gameSessionControl.ExecuteAttack(attackEvent);
        }
    }

    public async Task MoveShip(MoveShipEvent moveShipEvent)
    {
        if (await IsControlAllowed(moveShipEvent))
        {
            await _gameSessionControl.MoveShip(moveShipEvent);
        }
    }

    private async Task<bool> IsControlAllowed(IGameEvent gameEvent)
    {
        var player = (await _battleshipsDatabase.PlayersRepository
                .GetWhere(p => 
                    p.GameSessionId == gameEvent.GameSessionId &&
                    p.UserId == gameEvent.InitiatorUserId &&
                    p.IsCurrentPlayerTurn)
            ).FirstOrDefault();

        if (player is not null)
        {
            return true;
        }

        throw new InvalidOperationException(
            $"{gameEvent.InitiatorUserId} cannot perform {typeof(IGameEvent).DeclaringType!.Name} action in game session {gameEvent.GameSessionId}"
        );
    }
}