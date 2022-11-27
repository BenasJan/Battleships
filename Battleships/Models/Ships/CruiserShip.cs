namespace Battleships.Models.Ships
{
    public class CruiserShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Cruiser ship {State.GetState()}!";
        }
    }
}