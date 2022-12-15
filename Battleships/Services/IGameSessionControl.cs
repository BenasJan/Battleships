using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public interface IGameSessionControl
{
    Task ExecuteAttack(AttackEvent attackEvent);
    Task MoveShip(MoveShipEvent moveShipEvent);
}