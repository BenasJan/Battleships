using System.Collections.Generic;
using System.Threading.Tasks;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace Battleships.Adapter
{
    public class SendGridEmailProvider : IEmailProvider
    {
        private readonly SendGridClient client = new SendGridClient("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");
        private readonly EmailAddress from = new EmailAddress("noreply@battleships.com", "Battleships");
        public async Task SendEmail(Email email)
        {
            var subject = email.Subject;
            var to = new EmailAddress(email.To, email.Name);
            var plainTextContent = email.Body;
            var htmlContent = $"<strong>{email.Body}</strong>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
        }

        public async Task SendToAllRecipients()
        {
            var tos = new List<EmailAddress>
            {
                new EmailAddress("test1@example.com", "Example User1"),
                new EmailAddress("test2@example.com", "Example User2"),
                new EmailAddress("test3@example.com", "Example User3")
            };
            var subjects = new List<string> { "Test Subject1", "Test Subject2", "Test Subject3" };
            var plainTextContent = "Hello -name-";
            var htmlContent = "Goodbye -name-";
            var substitutions = new List<Dictionary<string, string>>
            {
                new Dictionary<string, string>() {{"-name-", "Name1"}},
                new Dictionary<string, string>() {{"-name-", "Name2"}},
                new Dictionary<string, string>() {{"-name-", "Name3"}}
            };

            var msg = MailHelper.CreateMultipleEmailsToMultipleRecipients(from,
                tos,
                subjects,
                plainTextContent,
                htmlContent,
                substitutions
            );
            var response = await client.SendEmailAsync(msg);
        }
    }
}
