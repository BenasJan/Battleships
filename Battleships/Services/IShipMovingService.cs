using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services;

public interface IShipMovingService
{
    Task MoveShip(MoveShipEvent moveShipEvent);
}