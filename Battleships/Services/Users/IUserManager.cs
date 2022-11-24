using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Services.Users;

public interface IUserManager
{
    IQueryable<ApplicationUser> Users { get; }
    Task<ApplicationUser> GetById(string userId);
}