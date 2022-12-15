namespace Battleships.Models.Ships
{
    public class SubmarineShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Submarine ship {State.GetState()}!";
        }

        public override int CalculateGuns()
        {
            return 2;
        }

        public override int CalculateWeight()
        {
            return CalculateGuns() + 5;
        }
    }
}