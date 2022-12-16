using Battleships.Adapter;

namespace Battleships.Services
{
    public class EmailSendingService
    {
        public void FinishSendEmail(Email email)
        {
            var provider = GetAgencyEmailProvider(email.Provider);

            provider.SendEmail(email);
        }

        private static IEmailProvider GetAgencyEmailProvider(string provider)
        {

            if (provider == "SMTP")
            {
                return new SmtpEmailProvider();
            }
            
            return new SendGridEmailProvider();
        }
    }
}
