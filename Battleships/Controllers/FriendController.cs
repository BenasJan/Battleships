using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Friends.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace Battleships.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FriendController : ControllerBase
    {
        private readonly IFriendsService _friendsService;

        public FriendController(IFriendsService friendsService)
        {
            _friendsService = friendsService;
        }

        [HttpGet("listFriends")]
        public async Task<IActionResult> ListFriends()
        {
            var friends = await _friendsService.ListFriends();

            return Ok(friends);
        }

        [HttpPost("addFriend")]
        public async Task<IActionResult> AddFriend([FromBody] FriendAddDto friendAddBody)
        {
            var success = await _friendsService.AddFriend(friendAddBody.UserId);

            return Ok(success);
        }        
        [HttpPost("removeFriend")]
        public async Task<IActionResult> RemoveFriend([FromBody] FriendDto friend)
        {
            var success = await _friendsService.RemoveFriend(friend);

            return Ok(success);
        }


        //[HttpPost("createSession")]
        //public async Task<IActionResult> CreateSessions([FromBody] GameSessionRequestDto gameSessionDto)
        //{
        //    Console.WriteLine("creating session...");
        //    Console.WriteLine(gameSessionDto.Name);
        //    Console.WriteLine(gameSessionDto.SettingsDto.GridSize);
        //    // var gameSessions = await _gameSessionService.ListAllSessions();

        //    return Ok(await _gameSessionService.CreateSession(gameSessionDto));
        //}
    }
}
