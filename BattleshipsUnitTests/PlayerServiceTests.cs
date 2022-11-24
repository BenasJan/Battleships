using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.Players;
using Battleships.Services.Players.Interfaces;
using Battleships.Services.Users;
using Microsoft.AspNetCore.Identity;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BattleshipsUnitTests
{
    public class PlayerServiceTests
    {
        private readonly PlayersService _playersService;

        private readonly IPlayersService _playerService;
        private readonly Mock<IPlayersRepository> _playersRepositoryMock;
        private readonly Mock<ICurrentUserService> _currentUserServiceMock;
        private readonly Mock<IUserManager> _userManagerMock;
        private readonly ICurrentUserService _currentUserService;

        public PlayerServiceTests()
        {
            _playersRepositoryMock = new Mock<IPlayersRepository>();
            _currentUserServiceMock = new Mock<ICurrentUserService>();
            _userManagerMock = new Mock<IUserManager>();


            _currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("1");

            var dbMock = GetDbMock(_playersRepositoryMock);

            dbMock.Setup(db => db.PlayersRepository.GetWhere(It.IsAny<Expression<Func<Player, bool>>>())).ReturnsAsync(
                new List<Player>
                {
                    new Player
                    {
                        Id = Guid.NewGuid(),
                    }
                });
            _playerService = new PlayersService(dbMock.Object, _userManagerMock.Object, _currentUserServiceMock.Object);
        }

        [Fact]
        public async Task When_GettingAllUsers_ReturnAllUsers()
        {
            var users = await _playerService.GetAllUsers();

            Assert.Equal(users.Count, 2);
        }

        //[Fact]
        //public async Task When_InvitingUserToGame()
        //{
        //    var gameSession = GetGameSession();
        //    var userId = Guid.NewGuid();
        //    SetupUserManager(userId.ToString(), "InvitedUserName");

        //    await _playerService.InviteUserToGame(gameSession.Id, userId.ToString());
        //}
        private static Mock<IBattleshipsDatabase> GetDbMock(
        Mock<IPlayersRepository> playerRepositoryMock)
        {
            var mock = new Mock<IBattleshipsDatabase>();

            return mock;
        }

        private static GameSession GetGameSession()
        {
            return new GameSession
            {
                Id = Guid.NewGuid(),
                Players = new List<Player>
            {
                new() { IsCurrentPlayerTurn = true },
                new() { IsCurrentPlayerTurn = false },
            }
            };
        }
    }
}
