namespace Battleships.Models.Ships
{
    public class DummyShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Dummy ship {State.GetState()}!";
        }
    }
}
