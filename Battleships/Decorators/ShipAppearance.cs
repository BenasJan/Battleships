using Battleships.Models;
using Battleships.Models.Ships;

namespace Battleships.Decorators
{
    public class ShipAppearance : PlayerShip
    {
        public string Label { get; set; }
        public string Skin { get; set; }
        public Ship Draw()
        {
            return null;
        }
    }
}
