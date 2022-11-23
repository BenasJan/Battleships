using Battleships.Models.Ships;

namespace Battleships.Bridge;

public class OnState : IShipState
{
    private readonly Ship _ship;

    public OnState(Ship ship)
    {
        _ship = ship;
    }

    public void ChangeState()
    {
        _ship.Name = "OnState No name provided";
        _ship.Description = "OnState No description provided";
    }

    public string GetState()
    {
        return "is On";
    }
}