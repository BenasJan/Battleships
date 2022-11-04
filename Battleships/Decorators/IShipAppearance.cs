using Battleships.Models.Ships;

namespace Battleships.Decorators
{
    public interface IShipAppearance
    {
        ShipAppearance Draw();
        string SkinName { get; }
    }
}
