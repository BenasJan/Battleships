using System;
using System.ComponentModel.DataAnnotations;

namespace Battleships.Models
{
    public class BaseModel
    {
        [Key]
        public Guid Id { get; set; }
    }
}