using Battleships.Controllers;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Battleships.Models
{
    public class Friend : BaseModel
    {
        [Required]
        [ForeignKey("ApplicationUser")]
        public Guid User1 { get; set; }

        [Required]
        [ForeignKey("ApplicationUser")]
        public Guid User2 { get; set; }

        public void Invite()
        {
            
        }

        public void Remove()
        {
            // call controller.removeFriend(obj)?
        }

        public void Favorite()
        {

        }
    }
}
