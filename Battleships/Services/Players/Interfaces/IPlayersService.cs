using System;
using Battleships.Data.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Battleships.Services.Players.Interfaces
{
    public interface IPlayersService
    {
        Task<List<UserDto>> GetAllUsers();
        Task<List<UserDto>> GetLobbyUsers(Guid gameSessionId);
        Task InviteUserToGame(Guid gameSessionId, string userId);
    }
}
