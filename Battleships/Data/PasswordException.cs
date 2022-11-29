using System;

namespace Battleships.Data
{
    [Serializable]
    public class PasswordException : Exception
    {
        public PasswordException(string message) : base(message)
        {
        
        }
    }
}