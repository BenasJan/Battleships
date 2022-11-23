using Battleships.Models.Ships;

namespace Battleships.Services.Bridge
{
    public class OnState : IShipState
    {
        private Ship ship;
    
        public void ChangeState()
        {
            ship.Name = "OnState No name provided";
            ship.Description = "OnState No description provided";
        }

        public string GetState()
        {
            return "is On";
        }

        public void ni()
        {
            throw new System.NotImplementedException();
        }
    }
}