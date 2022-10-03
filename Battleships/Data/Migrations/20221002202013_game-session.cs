using Microsoft.EntityFrameworkCore.Migrations;

namespace Battleships.Data.Migrations
{
    public partial class gamesession : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsHost",
                table: "Player",
                type: "INTEGER",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "Icon",
                table: "GameSession",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "GameSession",
                type: "TEXT",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsHost",
                table: "Player");

            migrationBuilder.DropColumn(
                name: "Icon",
                table: "GameSession");

            migrationBuilder.DropColumn(
                name: "Name",
                table: "GameSession");
        }
    }
}
