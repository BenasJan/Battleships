using AutoMapper.Configuration.Annotations;
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

            currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("00000000-0000-0000-0000-000000000010");

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

        [Fact]
        public async Task When_ListFriends_ReturnsFriends()
        {
            var friendIds = await _friendsService.ListFriends();

            Assert.Single(friendIds);
        }

        [Fact]
        public async Task When_Addfriend_ReturnCorrectResponse()
        {
            var addedBool = await _friendsService.AddFriend("00000000-0000-0000-0000-000000000000");

            Assert.True(addedBool);
        }

        [Fact]
        public async Task When_AddfriendWithWrongId_ReturnCorrectResponse()
        {
            var addedBool = await _friendsService.AddFriend("00000000-0000-0000-0000-000000000010");

            Assert.False(addedBool);
        }

    }
}
