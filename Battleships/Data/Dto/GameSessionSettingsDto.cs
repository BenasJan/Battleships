using Battleships.Models.enums;

namespace Battleships.Data.Dto
{
    public class GameSessionSettingsDto
    {
        public int RowCount { get; set; }
        public int ColumnCount { get; set; }
        public GameTypes GameType { get; set; }
    }
}