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

        [HttpGet("listPlayers")]
        public async Task<IActionResult> ListPlayers()
        {
            var players = await _playersService.ListPlayers();

            return Ok(players);
        }
    }
}
