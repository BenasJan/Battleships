using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Battleships.Models
{
    public class Friend : BaseModel
    {
        [Required]
        [ForeignKey("ApplicationUser")]
        public Guid InitiatingUserId { get; set; }

        public ApplicationUser InitiatingUser { get; set; }
        
        [Required]
        [ForeignKey("ApplicationUser")]
        public Guid AddedUserId { get; set; }

        public ApplicationUser AddedUser { get; set; }
    }
}
