using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Players.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace Battleships.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlayerController : ControllerBase
    {
        private readonly IPlayersService _playersService;

        public PlayerController(IPlayersService playersService)
        {
            _playersService = playersService;
        }

        [HttpGet("all-users")]
        public async Task<IActionResult> ListPlayers()
        {
            var allUsers = await _playersService.GetAllUsers();

            return Ok(allUsers);
        }
        
        [HttpGet("lobby-users")]
        public async Task<IActionResult> ListLobbyPlayers([FromQuery] Guid gameSessionId)
        {
            var players = await _playersService.GetLobbyUsers(gameSessionId);

            return Ok(players);
        }
    }
}
