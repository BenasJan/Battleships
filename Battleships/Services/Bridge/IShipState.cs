namespace Battleships.Services.Bridge
{
    public interface IShipState
    {
        void ChangeState();
        string GetState();
    }
}