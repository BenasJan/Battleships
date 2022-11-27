﻿using Battleships.Data.Dto;
using Battleships.Services.Friends.Interfaces;
using Microsoft.AspNetCore.Mvc;
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
    }
}
