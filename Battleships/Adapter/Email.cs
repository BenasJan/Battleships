namespace Battleships.Adapter
{
    public class Email
    {
        public string Subject { get; set; }
        public string Body { get; set; }
        public string To { get; set; }
        public string Name { get; set; }
        public string Provider { get; set; }
        public Email()
        {
        }

        public Email(string subject, string body, string to, string name, string provider)
        {
            Subject = subject;
            Body = body;
            To = to;
            Name = name;
            Provider = provider;
        }
    }
}
