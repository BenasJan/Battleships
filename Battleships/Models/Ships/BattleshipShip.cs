namespace Battleships.Models.Ships
{
    public class BattleshipShip : Ship
    {
        public override void ChangeState()
        {
            base.Description = $"Battleship ship {_state.GetState()}!";

        }
    }
}