
using System.Security.Principal;

namespace Battleships.Decorators
{
    public class Notifier : INotification
    {
        public void SendNotification(string message)
        {
            System.Console.WriteLine(message);
        }
    }
}
