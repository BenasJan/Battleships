namespace Battleships.Decorators
{
    public abstract class NotificationDecorator : INotification
    {
        private INotification _wrappee;

        public NotificationDecorator(INotification wrappee)
        {
            _wrappee = wrappee;
        }

        public virtual void SendNotification(string message)
        {
            _wrappee.SendNotification("notification");
        }
    }
}
