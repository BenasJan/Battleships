using Battleships.Models.Ships;

namespace Battleships.Bridge;

public class OffState : IShipState
{
    private Ship ship;
    
    public void ChangeState()
    {
        ship.Name = "OffState No name provided";
        ship.Description = "OffState No description provided";
    }

    public string GetState()
    {
        return "is Off";
    }
}