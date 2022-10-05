﻿using System;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Services.GameSession.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Battleships.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GameSessionController: ControllerBase
    {
        private readonly IGameSessionService _gameSessionService;
        
        public GameSessionController(IGameSessionService gameSessionService)
        {
            _gameSessionService = gameSessionService;
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
    }
}