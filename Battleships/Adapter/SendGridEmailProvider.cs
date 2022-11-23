using SendGrid;
using SendGrid.Helpers.Mail;

namespace Battleships.Adapter
{
    public class SendGridEmailProvider : IEmailProvider
    {
        readonly SendGridClient _client = new("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");
        readonly EmailAddress _from = new("noreply@battleships.com", "Battleships");
        public async void SendEmail(Email email)
        {
            var subject = email.Subject;
            var to = new EmailAddress(email.To, email.Name);
            var plainTextContent = email.Body;
            var htmlContent = $"<strong>{email.Body}</strong>";
            var msg = MailHelper.CreateSingleEmail(_from, to, subject, plainTextContent, htmlContent);
            await _client.SendEmailAsync(msg);
        }
    }
}
