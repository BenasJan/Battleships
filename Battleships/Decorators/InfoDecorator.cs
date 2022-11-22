using System.Collections.Generic;

namespace Battleships.Decorators
{
    public class InfoDecorator : ShipDecorator
    {
        public InfoDecorator(IShipAppearance shipDecorator) : base(shipDecorator) { }

        public override ShipAppearance Draw()
        {
            ShipAppearance shipAppearance = base.Draw();
            var InfoList = new List<string>()
            {
                shipAppearance.Ship.Name,
                shipAppearance.Ship.Description
            };
            shipAppearance.Info = InfoList;

            return shipAppearance;
        }
    }
}
