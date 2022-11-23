using Battleships.Models.Ships;

namespace Battleships.Services.Bridge
{
    public class OffState : IShipState
    {
        private readonly Ship _ship;

        public OffState(Ship ship)
        {
            _ship = ship;
        }

        public void ChangeState()
        {
            _ship.Name = "OffState No name provided";
            _ship.Description = "OffState No description provided";
        }

        public string GetState()
        {
            return "is Off";
        }
    }
}