using Battleships.Models.enums;

namespace Battleships.Data.Dto
{
    public class GameSessionSettingsDto
    {
        public string GridSize { get; set; }
        public GameTypes GameType { get; set; }
    }
}