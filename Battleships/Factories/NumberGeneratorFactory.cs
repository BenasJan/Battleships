using Battleships.Data;

namespace Battleships.Factories
{
    public class NumberGeneratorFactory
    {
        public NumberGenerator GetNumberGenerator(int maxValue)
        {
            var generator = new NumberGenerator(maxValue);

            return generator;
        }
    }
}