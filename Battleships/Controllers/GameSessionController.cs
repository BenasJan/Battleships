using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Data.Events;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.EventConsumers;
using Battleships.Services.GameSession.Interfaces;
using Battleships.Services.Players.Interfaces;
using Battleships.SignalR.Interfaces;
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
        private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;
        private readonly IInGameSessionHelperService _inGameSessionHelperService;

        public GameSessionController(
            IGameSessionService gameSessionService,
            IPlayersService playersService,
            IGameLaunchService gameLaunchService,
            IBattleshipsSynchronizationService battleshipsSynchronizationService,
            IInGameSessionHelperService inGameSessionHelperService
            )
        {
            _gameSessionService = gameSessionService;
            _playersService = playersService;
            _gameLaunchService = gameLaunchService;
            _battleshipsSynchronizationService = battleshipsSynchronizationService;
            _inGameSessionHelperService = inGameSessionHelperService;
        }

        [HttpPost("createSession")]
        public async Task<IActionResult> CreateSessions([FromBody] GameSessionRequestDto gameSessionDto)
        {
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
            var game = await _gameSessionService.GetSession(id);
            return Ok(game);
        }

        [HttpGet("in-game/{gameSessionId:guid}")]
        public async Task<IActionResult> GetInGameSession(Guid gameSessionId)
        {
            var dto = await _inGameSessionHelperService.GetInGameSession(gameSessionId);

            return Ok(dto);
        }

        [HttpPost("launch-game/{gameSessionId:guid}")]
        public async Task<IActionResult> LaunchGame(Guid gameSessionId, bool rematch)
        {
            await _gameLaunchService.LaunchGame(gameSessionId, rematch);

            return Ok();
        }
        
        [HttpPost("invite/{gameSessionId:guid}")]
        public async Task<IActionResult> InvitePlayer(Guid gameSessionId, [FromBody] UserInviteDto invite)
        {
            await _playersService.InviteUserToGame(gameSessionId, invite.UserId);
            
            Response.OnCompleted(async () =>
                await _battleshipsSynchronizationService.InviteUserToGame(gameSessionId, invite.UserId));

            return Ok();
        }

        [HttpPost("move-ship/{gameSessionId:guid}")]
        public async Task<IActionResult> MoveShip(Guid gameSessionId, [FromBody] ShipMoveDto shipMoveDto)
        {
            //Guid gameSessionId, [FromBody] Guid shipId, [FromBody] string direction
            var dto = await _gameSessionService.MoveShipInSession(gameSessionId, shipMoveDto.ShipId, shipMoveDto.Direction);

            return Ok(dto);
        } 
    }
}