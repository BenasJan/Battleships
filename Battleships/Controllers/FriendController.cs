using Battleships.Data.Dto;
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
    }
}
