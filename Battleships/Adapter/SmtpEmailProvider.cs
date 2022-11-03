using System.Net;
using System.Net.Mail;

namespace Battleships.Adapter
{
    public class SmtpEmailProvider : IEmailProvider
    {
        readonly SmtpClient _smtpClient = new ();
        public void SendEmail(Email email)
        {
            _smtpClient.Host = "smtp.gmail.com";
            _smtpClient.Port = 587;
            _smtpClient.UseDefaultCredentials = false;
            _smtpClient.EnableSsl = true;
            _smtpClient.Credentials = new NetworkCredential("noreply@battleships.com", "password");
            _smtpClient.Send("noreply@battleships.com", email.To, email.Subject, email.Body);
        }
    }
}
