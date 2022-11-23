using System.Security.Cryptography;

namespace Battleships.Data;

public class NumberGenerator
{
    private readonly int _maxValue;
    
    public NumberGenerator(int maxValue)
    {
        _maxValue = maxValue;
    }

    public int GenerateNumber()
    {
        return RandomNumberGenerator.GetInt32(_maxValue);
    }
}