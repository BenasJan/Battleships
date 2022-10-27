using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class Gameplay : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsOver",
                table: "GameSession");

            migrationBuilder.AddColumn<string>(
                name: "ShipType",
                table: "Ship",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ColumnCount",
                table: "GameSessionSettings",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "RowCount",
                table: "GameSessionSettings",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "GameSession",
                type: "integer",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ShipType",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "ColumnCount",
                table: "GameSessionSettings");

            migrationBuilder.DropColumn(
                name: "RowCount",
                table: "GameSessionSettings");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "GameSession");

            migrationBuilder.AddColumn<bool>(
                name: "IsOver",
                table: "GameSession",
                type: "boolean",
                nullable: false,
                defaultValue: false);
        }
    }
}
