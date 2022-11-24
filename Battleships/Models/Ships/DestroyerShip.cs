namespace Battleships.Models.Ships
{
    public class DestroyerShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Destroyer ship {State.GetState()}!";
        }
    }
}