using Microsoft.EntityFrameworkCore.Migrations;

namespace Battleships.Data.Migrations
{
    public partial class gamesessionsettingscolumns : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "DestroyedShipPercentage",
                table: "GameSessionSettings",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "GameType",
                table: "GameSessionSettings",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "GridSize",
                table: "GameSessionSettings",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "RoundCount",
                table: "GameSessionSettings",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DestroyedShipPercentage",
                table: "GameSessionSettings");

            migrationBuilder.DropColumn(
                name: "GameType",
                table: "GameSessionSettings");

            migrationBuilder.DropColumn(
                name: "GridSize",
                table: "GameSessionSettings");

            migrationBuilder.DropColumn(
                name: "RoundCount",
                table: "GameSessionSettings");
        }
    }
}
