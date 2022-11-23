using System;

namespace Battleships.Data
{
    public class PasswordException : Exception
    {
        public PasswordException(string message) : base(message)
        {
        
        }
    }
}