using System;

namespace Battleships.Data.Dto.InGameSession
{
    public class ShipMoveDto
    {
        public Guid ShipId { get; set; }
        public string Direction { get; set; }

    }
}
