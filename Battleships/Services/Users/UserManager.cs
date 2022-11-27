using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Models;
using Microsoft.AspNetCore.Identity;

namespace Battleships.Services.Users;

public class UserManager : IUserManager
{
    private readonly UserManager<ApplicationUser> _userManager;
    //public IQueryable<ApplicationUser> Users;
    IQueryable<ApplicationUser> IUserManager.Users => _userManager.Users;


    public UserManager(UserManager<ApplicationUser> userManager)
    {
        _userManager = userManager;
    }

    public async Task<ApplicationUser> GetById(string userId)
    {
        return await _userManager.FindByIdAsync(userId);
    }
}
