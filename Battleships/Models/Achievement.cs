﻿namespace Battleships.Models
{
    public class Achievement : BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string RequiredAction { get; set; }
        public int ActionPerformedCount { get; set; }
        public int RequiredActionPerformedCount { get; set; }
        
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
    }
}