namespace Battleships.Models.Ships
{
    public class CruiserShip : Ship
    {
        public int GunCount { get; set; }
        public int TurretsCount { get; set; }
        public override void ChangeState()
        {
            base.Description = $"Cruiser ship {State.GetState()}!";
        }

        public override int CalculateGuns()
        {
            return GunCount * TurretsCount;
        }

        public override int CalculateWeight()
        {
            return GunCount * TurretsCount;
        }
    }
}