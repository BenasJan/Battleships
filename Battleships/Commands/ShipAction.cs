using Newtonsoft.Json.Bson;

namespace Battleships.Commands
{
    public class ShipAction
    {
        public void MoveUp()
        {
            System.Console.WriteLine("moving ship up");
        }
        public void MoveDown()
        {
            System.Console.WriteLine("moving ship down");
        }
        public void MoveLeft()
        {
            System.Console.WriteLine("moving ship left");
        }
        public void MoveRight()
        {
            System.Console.WriteLine("moving ship right");
        }
    }
}
