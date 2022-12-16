namespace Battleships.Models.Ships
{
    public class DestroyerShip : Ship
    {
        public int GunCount { get; set; }
        public int TurretsCount { get; set; }
        public int ArmourMm { get; set; }
        public override void ChangeState()
        {
            base.Description = $"Destroyer ship {State.GetState()}!";
        }

        public override int CalculateGuns()
        {
            return GunCount * TurretsCount;
        }

        public override int CalculateWeight()
        {
            return GunCount * TurretsCount + ArmourMm;
        }
    }
}