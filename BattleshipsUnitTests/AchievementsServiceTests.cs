using System.Linq.Expressions;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Achievement;
using Battleships.Services.Achievement.Interfaces;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Friends;
using Battleships.Services.Users;
using Moq;

namespace BattleshipsUnitTests;

public class AchievementsServiceTests
{
    private readonly AchievementService _achievementService;
    private readonly Mock<IRepository<Achievement>> _achievementsRepository;

    public AchievementsServiceTests()
    {
        _achievementsRepository = new Mock<IRepository<Achievement>>();

        var databaseMock = GetDbMock(_achievementsRepository);

        _achievementService = new AchievementService(databaseMock.Object);
    }

    [Fact]
    public async Task When_GetFriendIds_ReturnsIds()
    {
        var achievements = new List<Achievement>
        {
            new()
            {
                Id = Guid.NewGuid()
            },
            new()
            {
                Id = Guid.NewGuid()
            }
        };
        SetupAchievementsGetAll(achievements);
        
        var actual = await _achievementService.ListAchievements();

        Assert.Equal(2, actual.Count);
    }

    private void SetupAchievementsGetAll(List<Achievement> achievements)
    {
        _achievementsRepository.Setup(x => x.GetAll())
            .ReturnsAsync(achievements);
    }
    
    private static Mock<IBattleshipsDatabase> GetDbMock(
        Mock<IRepository<Achievement>> achievementsRepositoryMock
    )
    {
        var mock = new Mock<IBattleshipsDatabase>();
        mock.Setup(db => db.AchievementsRepository).Returns(achievementsRepositoryMock.Object);
        return mock;
    }
}
