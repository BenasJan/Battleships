using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Friends;
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
        private readonly Mock<UserManager<ApplicationUser>> userManagerMock;
        private readonly Mock<ICurrentUserService> currentUserServiceMock;
        private List<ApplicationUser> _users = new List<ApplicationUser>
        {
            new ApplicationUser() { Id = string.Format("1") },
            new ApplicationUser() { Id = string.Format("2") },
        };

        public FriendsServiceTests() 
        {

            dbMock = new Mock<IBattleshipsDatabase>();
            userManagerMock = MockUserManager(_users);
            currentUserServiceMock = new Mock<ICurrentUserService>();

            currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("1");

            dbMock.Setup(db => db.FriendsRepository.GetWhere(It.IsAny<Expression<Func<Friend, bool>>>())).ReturnsAsync(
                new List<Friend> 
                { 
                    new Friend()
                })));

            friendsService = new FriendsService(dbMock.Object, userManagerMock.Object, currentUserServiceMock.Object);
        }

        [Fact]
        public async Task When_ListsFriends_ReturnsFriends()
        {
            var friendsList = await friendsService.ListFriends();

            Assert.Equal(1, friendsList.Count);
        }


        public static Mock<UserManager<TUser>> MockUserManager<TUser>(List<TUser> ls) where TUser : class
        {
            var store = new Mock<IUserStore<TUser>>();
            var mgr = new Mock<UserManager<TUser>>(store.Object, null, null, null, null, null, null, null, null);
            mgr.Object.UserValidators.Add(new UserValidator<TUser>());
            mgr.Object.PasswordValidators.Add(new PasswordValidator<TUser>());

            mgr.Setup(x => x.DeleteAsync(It.IsAny<TUser>())).ReturnsAsync(IdentityResult.Success);
            mgr.Setup(x => x.CreateAsync(It.IsAny<TUser>(), It.IsAny<string>())).ReturnsAsync(IdentityResult.Success).Callback<TUser, string>((x, y) => ls.Add(x));
            mgr.Setup(x => x.UpdateAsync(It.IsAny<TUser>())).ReturnsAsync(IdentityResult.Success);

            return mgr;
        }


    }
}
