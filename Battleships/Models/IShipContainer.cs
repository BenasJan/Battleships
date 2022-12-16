using Battleships.Models.Ships;

namespace Battleships.Models;

public interface IShipContainer<TShip> where TShip : Ship
{
    public TShip Type { get; set; }
}