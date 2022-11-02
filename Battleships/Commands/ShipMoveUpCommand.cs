using Battleships.Models;

namespace Battleships.Commands
{
    public class ShipMoveUpCommand : IShipActionCommand
    {
        private PlayerShip ship;

        public ShipMoveUpCommand (PlayerShip ship)
        {
            this.ship = ship;
        }   

        public void Execute()
        {
            ship.MoveUp();
        }
    }
}
