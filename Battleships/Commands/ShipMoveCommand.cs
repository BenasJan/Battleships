using Battleships.Models;

namespace Battleships.Commands
{
    public class ShipMoveUpCommand : IShipActionCommand
    {
        private readonly PlayerShip _ship;

        public ShipMoveUpCommand(PlayerShip ship)
        {
            _ship = ship;
        }   

        public void Execute()
        {
            _ship.MoveUp();
        }
    }

    public class ShipMoveDownCommand : IShipActionCommand
    {
        private readonly PlayerShip _ship;

        public ShipMoveDownCommand(PlayerShip ship)
        {
            this._ship = ship;
        }

        public void Execute()
        {
            _ship.MoveDown();
        }
    }

    public class ShipMoveLeftCommand : IShipActionCommand
    {
        private readonly PlayerShip _ship;

        public ShipMoveLeftCommand(PlayerShip ship)
        {
            this._ship = ship;
        }

        public void Execute()
        {
            _ship.MoveLeft();
        }
    }

    public class ShipMoveRightCommand : IShipActionCommand
    {
        private readonly PlayerShip _ship;

        public ShipMoveRightCommand(PlayerShip ship)
        {
            _ship = ship;
        }

        public void Execute()
        {
            _ship.MoveRight();
        }
    }
}
