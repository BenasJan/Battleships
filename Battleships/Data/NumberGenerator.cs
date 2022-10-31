using System;

namespace Battleships.Data;

public class NumberGenerator
{
    private readonly Random _random;
    private readonly int _maxValue;
    
    public NumberGenerator(int maxValue)
    {
        _random = new Random();
        _maxValue = maxValue;
    }

    public int GenerateNumber()
    {
        return _random.Next(_maxValue);
    }
}