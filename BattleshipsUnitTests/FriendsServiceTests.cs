using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Friends;
using Battleships.Services.Users;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.Identity;
using Moq;
using System.Linq.Expressions;

namespace BattleshipsUnitTests
{
    public class FriendsServiceTests
    {
        private readonly FriendsService friendsService;

        private readonly Mock<IBattleshipsDatabase> dbMock;
        private readonly Mock<IUserManager> userManagerMock;
        private readonly Mock<ICurrentUserService> currentUserServiceMock;

        public FriendsServiceTests()
        {

            dbMock = new Mock<IBattleshipsDatabase>();
            userManagerMock = new Mock<IUserManager>();
            currentUserServiceMock = new Mock<ICurrentUserService>();

            currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("1");

            dbMock.Setup(db => db.FriendsRepository.GetWhere(It.IsAny<Expression<Func<Friend, bool>>>())).ReturnsAsync(
                new List<Friend>
                {
                    new Friend
                    {
                        Id = Guid.NewGuid(),
                    }
                });

            friendsService = new FriendsService(dbMock.Object, userManagerMock.Object, currentUserServiceMock.Object);
        }

        [Fact]
        public async Task When_GetFriendIds_ReturnsIds()
        {
            var friendIds = await friendsService.GetFriendsIds("00000000-0000-0000-0000-000000000000");

            Assert.Single(friendIds);
        }
    }
}
