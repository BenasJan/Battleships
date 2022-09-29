using System;
using System.Security.Claims;
using Battleships.Data.Constants;
using Battleships.Services.Authentication.Interfaces;
using Microsoft.AspNetCore.Http;

namespace Battleships.Services.Authentication
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CurrentUserService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public string GetCurrentUserId()
        {
            var userId = GetClaimValue(BattleshipClaims.UserId);
        
            return userId;
        }
        
        private string GetClaimValue(string claimType)
        {
            var claimValue = _httpContextAccessor.HttpContext?.User.FindFirstValue(claimType);

            if (claimValue is null)
            {
                throw new InvalidOperationException($"Claim {claimType} not found");
            }

            return claimValue;
        }
    }
}