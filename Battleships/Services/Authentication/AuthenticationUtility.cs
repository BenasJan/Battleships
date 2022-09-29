using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace Battleships.Services.Authentication
{
    public class AuthenticationUtility
    {
        private const string Key = "P5mcQ0xbgVDMKwvqyv1OrGpQJntbyctc9wf7fh54Ugp0U0VkD7sQC8h8mRaNdS08O9Bfy";
    
        public static SymmetricSecurityKey GetSymmetricSecurityKey()
        {
            return new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Key));
        }
    }
}