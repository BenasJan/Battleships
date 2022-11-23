namespace Battleships.Decorators
{
    public class SkinDecorator : ShipDecorator
    {
        public SkinDecorator(IShipAppearance shipDecorator) : base(shipDecorator) { }

        public override ShipAppearance Draw()
        {
            ShipAppearance shipAppearance = base.Draw();
            shipAppearance.SkinName = "Blue";

            return shipAppearance;
        }
    }
}
