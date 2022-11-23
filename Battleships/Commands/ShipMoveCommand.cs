using Battleships.Models;

namespace Battleships.Commands
{
    public class ShipMoveUpCommand : IShipActionCommand
    {
        private PlayerShip ship;

        public ShipMoveUpCommand(PlayerShip ship)
        {
            this.ship = ship;
        }   

        public void Execute()
        {
            ship.MoveUp();
        }
    }

    public class ShipMoveDownCommand : IShipActionCommand
    {
        private PlayerShip ship;

        public ShipMoveDownCommand(PlayerShip ship)
        {
            this.ship = ship;
        }

        public void Execute()
        {
            ship.MoveDown();
        }
    }

    public class ShipMoveLeftCommand : IShipActionCommand
    {
        private PlayerShip ship;

        public ShipMoveLeftCommand(PlayerShip ship)
        {
            this.ship = ship;
        }

        public void Execute()
        {
            ship.MoveLeft();
        }
    }

    public class ShipMoveRightCommand : IShipActionCommand
    {
        private PlayerShip ship;

        public ShipMoveRightCommand(PlayerShip ship)
        {
            this.ship = ship;
        }

        public void Execute()
        {
            ship.MoveRight();
        }
    }
}
