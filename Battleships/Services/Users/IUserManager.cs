using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Models;

namespace Battleships.Services.Users
{
    public interface IUserManager
    {
        Task<ApplicationUser> GetById(string userId);
        IQueryable<ApplicationUser> Users { get; }

        IQueryable<ApplicationUser> GetWhere(Expression<Func<ApplicationUser, bool>> filter);

        Task<List<UserDto>> GetOtherUsers(string currentUserId);
    }
}