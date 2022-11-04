using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class AddShipState : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Engine",
                table: "ShipTile",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "GunCount",
                table: "ShipTile",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Guns",
                table: "ShipTile",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<bool>(
                name: "IsFlagship",
                table: "ShipTile",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "Shield",
                table: "ShipTile",
                type: "boolean",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Engine",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "GunCount",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "Guns",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "IsFlagship",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "Shield",
                table: "ShipTile");
        }
    }
}
