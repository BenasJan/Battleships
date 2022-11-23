using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Services.Users;

public interface IUserManager
{
    Task<ApplicationUser> GetById(string userId);
}