using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Authentication;
using System.Security.Claims;
using System.Threading.Tasks;
using Battleships.Data.Constants;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Services.Authentication.Interfaces;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;

namespace Battleships.Services.Authentication
{
    public class AuthenticationService : IAuthenticationService
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public AuthenticationService(
            UserManager<ApplicationUser> userManager
        )
        {
            _userManager = userManager;
        }

        public async Task<string> Login(UserCredentialsDto userCredentialsDto)
        {
            var user = await _userManager.FindByEmailAsync(userCredentialsDto.Email);

            if (user == null || !await _userManager.CheckPasswordAsync(user, userCredentialsDto.Password))
            {
                throw new AuthenticationException("Invalid password");
            }

            var jwtToken = await CreateJwtToken(user);

            return jwtToken;
        }

        public async Task Register(UserCredentialsDto userCredentialsDto)
        {
            var newUser = new ApplicationUser
            {
                Email = userCredentialsDto.Email,
                UserName = userCredentialsDto.Email,
                EmailConfirmed = true,
                Name = "Name",
                Surname = "Surname"
            };

            await _userManager.CreateAsync(newUser);
            
            var createdUser = await _userManager.FindByEmailAsync(newUser.Email);
            await _userManager.AddPasswordAsync(createdUser, userCredentialsDto.Password);
        }

        private async Task<string> CreateJwtToken(ApplicationUser user)
        {
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = await GetClaimsIdentity(user),
                Expires = DateTime.UtcNow.AddHours(12),
                SigningCredentials =
                    new SigningCredentials(
                        AuthenticationUtility.GetSymmetricSecurityKey(),
                        SecurityAlgorithms.HmacSha256
                    )
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            var securityToken = tokenHandler.CreateToken(tokenDescriptor);
            var token = tokenHandler.WriteToken(securityToken);

            return token;
        }

        private async Task<ClaimsIdentity> GetClaimsIdentity(ApplicationUser user)
        {
            var claims = await GetClaims(user);
            var claimsIdentity = new ClaimsIdentity(claims);

            return claimsIdentity;
        }

        private async Task<List<Claim>> GetClaims(ApplicationUser user)
        {
            var claims = new List<Claim>
            {
                new(BattleshipClaims.UserId, user.Id.ToString())
            };

            return claims;
        }
    }
}