namespace Battleships.Bridge;

public interface IShipState
{
    void ChangeState();
    string GetState();
}