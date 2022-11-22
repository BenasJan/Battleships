using System;

namespace Battleships.Models
{
    public class Notification : BaseModel
    {
        public Guid NotificationId { get; set; }

        public string Type { get; set; }
        public string Text { get; set; }
        public Guid ReceiveUser { get; set; }


        
    }
}
