using System.Threading.Tasks;
using Battleships.Data.Dto;

namespace Battleships.Services.Authentication.Interfaces
{
    public interface IAuthenticationService
    {
        Task<string> Login(UserCredentialsDto userCredentialsDto);
        Task Register(UserCredentialsDto userCredentialsDto);
        Task<string> GetUserIdByEmail(string email);
    }
}