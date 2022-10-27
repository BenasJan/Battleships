using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Services.GameSession.Interfaces;
using Battleships.Services.Players.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Battleships.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GameSessionController: ControllerBase
    {
        private readonly IGameSessionService _gameSessionService;
        private readonly IPlayersService _playersService;
        private readonly IGameLaunchService _gameLaunchService;

        public GameSessionController(
            IGameSessionService gameSessionService,
            IPlayersService playersService,
            IGameLaunchService gameLaunchService
        )
        {
            _gameSessionService = gameSessionService;
            _playersService = playersService;
            _gameLaunchService = gameLaunchService;
        }

        [HttpPost("createSession")]
        public async Task<IActionResult> CreateSessions([FromBody] GameSessionRequestDto gameSessionDto)
        {
            Console.WriteLine("creating session...");
            Console.WriteLine(gameSessionDto.Name);
            Console.WriteLine(gameSessionDto.SettingsDto.GridSize);
            // var gameSessions = await _gameSessionService.ListAllSessions();

            return Ok(await _gameSessionService.CreateSession(gameSessionDto));
        }
        
        [HttpGet("listSessions")]
        public async Task<IActionResult> ListSessions()
        {
            Console.WriteLine("test conn");
            var gameSessions = await _gameSessionService.ListAllSessions();

            return Ok(gameSessions);
        }
        
        [HttpGet("getSession")]
        public async Task<IActionResult> GetSession(Guid id)
        {
            Console.WriteLine("Gettinam sessiona");
            Console.WriteLine(id);
            // var gameSessions = await _gameSessionService.ListAllSessions();
            var game = await _gameSessionService.GetSession(id);
            return Ok(game);
        }
        
        [HttpPost("addPlayer")]
        public async Task<IActionResult> GetSession(PlayerLobbyDtoWithSessionId dto)
        {
            Console.WriteLine("Addinam playeri");
            // Console.WriteLine(id);
            // var gameSessions = await _gameSessionService.ListAllSessions();
            var game = await _gameSessionService.AddPlayerToSession(dto);
            return Ok(game);
        }

        [HttpGet("in-game/{gameSessionId:guid}")]
        public async Task<IActionResult> GetInGameSession(Guid gameSessionId)
        {
            var dto = await _gameSessionService.GetInGameSession(gameSessionId);

            return Ok(dto);
        }

        [HttpPost("launch-game")]
        public async Task<IActionResult> LaunchGame(Guid gameSessionId)
        {
            await _gameLaunchService.LaunchGame(gameSessionId);

            return Ok();
        }
        
        [HttpPost("invite/{gameSessionId:guid}")]
        public async Task<IActionResult> InvitePlayer(Guid gameSessionId, [FromQuery] string userId)
        {
            await _playersService.InviteUserToGame(gameSessionId, userId);

            return Ok();
        }
    }
}