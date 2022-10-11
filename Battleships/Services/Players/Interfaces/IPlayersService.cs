using Battleships.Data.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Battleships.Services.Players.Interfaces
{
    public interface IPlayersService
    {
        Task<List<PlayerDto>> ListPlayers();
    }
}
