using Battleships.Models;
using System.Collections.Generic;
using System;

namespace Battleships.Data.Dto
{
    public class PlayerDto
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public int GamesPlayedCount { get; set; }
        public int GamesWonCount { get; set; }
    }
}

