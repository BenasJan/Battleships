using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class UpdatePlayer : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsCurrentPlayerTurn",
                table: "Player",
                type: "boolean",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsCurrentPlayerTurn",
                table: "Player");
        }
    }
}
