using Battleships.Data.Dto;
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

            var dbMock = GetDbMock(_playersRepositoryMock);

            _playerService = new PlayersService(dbMock.Object, _userManagerMock.Object, _currentUserServiceMock.Object);
        }

        //[Fact]
        //public async Task When_GettingAllUsers_Expect_AllUsers()
        //{
        //    var userDto = new List<UserDto>();

        //    userDto.Add(new UserDto());
        //    userDto.Add(new UserDto());

        //    SetupCurrentUserService();
        //    SetupUserManager(userDto);

        //    var users = await _playerService.GetAllUsers();

        //    Assert.Equal(userDto.Count, users.Count);
        //}

        [Theory]
        [InlineData(0)]
        [InlineData(1)]
        [InlineData(5)]
        public async Task When_GettingAllUsers_Expect_AllUsers(int userCount)
        {
            var userDtos = new List<UserDto>();
            for (int i = 0; i < userCount; i++)
            {
                userDtos.Add(new UserDto());
            }

            SetupCurrentUserService();
            SetupUserManager(userDtos);

            var users = await _playerService.GetAllUsers();

            Assert.Equal(userCount, users.Count);
        }

        [Fact]
        public async Task When_InvitingUserToGame_Expect_CreatedUser()
        {
            var gameSession = GetGameSession();
            var userId = "00000000-0000-0000-0000-000000000001";

            await _playerService.InviteUserToGame(gameSession.Id, userId);

            _playersRepositoryMock.Verify(repo => repo.Create(
                It.Is<Player>(expected => expected.UserId == userId)));
        }


        [Fact]
        public async Task When_GettingLobbyUsers_Expect_AllLobbyUsers()
        {
            var userDto = new List<UserDto>()
                {
                    new UserDto()
                    {
                        Id = "00000000-0000-0000-0000-000000000001",
                    },

                    new UserDto()
                    {
                        Id = "00000000-0000-0000-0000-000000000002"
                    }
                };

            var gameSession = GetGameSession();

            SetupUserManagerLobbyUsers(userDto, gameSession.Id);

            var players = await _playerService.GetLobbyUsers(gameSession.Id);

            Assert.Equal(userDto.Count, players.Count);


        }
        private static Mock<IBattleshipsDatabase> GetDbMock(
        Mock<IPlayersRepository> playerRepositoryMock)
        {
            var mock = new Mock<IBattleshipsDatabase>();

            mock.Setup(m => m.PlayersRepository).Returns(playerRepositoryMock.Object);

            return mock;
        }

        private static GameSession GetGameSession()
        {
            return new GameSession
            {
                Id = Guid.NewGuid(),
            };
        }

        private void SetupUserManager(List<UserDto> userDto)
        {
            _userManagerMock.Setup(um => um.GetOtherUsers("00000000-0000-0000-0000-000000000000"))
                .ReturnsAsync(userDto);
        }

        private void SetupUserManagerLobbyUsers(List<UserDto> userDto,Guid gameSessionId)
        {
            _userManagerMock.Setup(um => um.GetLobbyUsers(gameSessionId))
                .ReturnsAsync(userDto);
        }

        private void SetupCurrentUserService()
        {
            _currentUserServiceMock.Setup(cuMock => cuMock.GetCurrentUserId()).Returns("00000000-0000-0000-0000-000000000000");
        }
    }
}