namespace Battleships.Models.Ships
{
    public class SubmarineShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Submarine ship {State.GetState()}!";
        }
    }
}