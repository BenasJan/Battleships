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
        private readonly FriendsService _friendsService;

        public FriendsServiceTests()
        {
            var dbMock = new Mock<IBattleshipsDatabase>();
            var userManagerMock = new Mock<IUserManager>();
            var currentUserServiceMock = new Mock<ICurrentUserService>();

            currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("1");

            dbMock.Setup(db => db.FriendsRepository.GetWhere(It.IsAny<Expression<Func<Friend, bool>>>())).ReturnsAsync(
                new List<Friend>
                {
                    new()
                    {
                        Id = Guid.NewGuid(),
                    }
                });

            _friendsService = new FriendsService(dbMock.Object, userManagerMock.Object, currentUserServiceMock.Object);
        }

        [Fact]
        public async Task When_GetFriendIds_ReturnsIds()
        {
            var friendIds = await _friendsService.GetFriendsIds("00000000-0000-0000-0000-000000000000");

            Assert.Single(friendIds);
        }
    }
}
