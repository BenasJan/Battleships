using System.Threading.Tasks;

namespace Battleships.Adapter
{
    public interface IEmailProvider
    {
        Task SendEmail(Email email);
        Task SendToAllRecipients();
    }
}
