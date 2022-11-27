using Battleships.Utilities;

namespace BattleshipsUnitTests;

public class TimeUtilityTests
{

    public TimeUtilityTests()
    {
    }

    [Fact]
    public void When_GettingTimeUtility_Expect_SameInstance()
    {
        var firstTimeUtility = TimeUtility.GetTimeUtility();
        var secondTimeUtility = TimeUtility.GetTimeUtility();
        
        Assert.Equal(firstTimeUtility, secondTimeUtility);
    }
}