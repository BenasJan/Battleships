using System.ComponentModel.DataAnnotations;

namespace Battleships.Models
{
    public class Friend : BaseModel
    {
        [Required]
        public string InitiatingUserId { get; set; }

        public ApplicationUser InitiatingUser { get; set; }
        
        [Required]
        public string TargetUserId { get; set; }
        public ApplicationUser TargetUser { get; set; }
    }
}
