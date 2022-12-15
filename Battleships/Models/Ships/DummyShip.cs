namespace Battleships.Models.Ships
{
    public class DummyShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Dummy ship {State.GetState()}!";
        }

        public override int CalculateGuns()
        {
            return 0;
        }

        public override int CalculateWeight()
        {
            return 0;
        }
    }
}
