namespace Battleships.Decorators
{
    public class InviteDecorator : NotificationDecorator
    {
        public InviteDecorator(INotification notification) : base(notification) { }

        public override void SendNotification(string message)
        {
            string from = "from: "+ "User";
            base.SendNotification(from + "\n" + message);
        }
    }
}
