namespace Battleships.Decorators
{
    public class LabelDecorator : ShipDecorator
    {
        public LabelDecorator(IShipAppearance shipDecorator) : base(shipDecorator) { }

        public override ShipAppearance Draw()
        {
            ShipAppearance shipAppearance = base.Draw();
            shipAppearance.Label = shipAppearance.Ship.ShipType;

            return shipAppearance;

        }
    }
}
