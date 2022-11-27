using Battleships.Models.Ships;

namespace Battleships.Decorators
{
    public class ShipDecorator : IShipAppearance
    {
        private readonly IShipAppearance _shipDecorator;

        public string SkinName => _shipDecorator.SkinName;
        public string Label => _shipDecorator.Label;

        protected ShipDecorator(IShipAppearance shipDecorator)
        {
            _shipDecorator = shipDecorator;
        }

        public virtual ShipAppearance Draw()
        {
            return _shipDecorator.Draw();
        }
    }
}
