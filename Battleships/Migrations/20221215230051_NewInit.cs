using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class NewInit : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ArmourMm",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BattleshipShip_GunCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BattleshipShip_TurretsCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CarrierShip_GunCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CruiserShip_GunCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CruiserShip_TurretsCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "GunCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PlaneCount",
                table: "Ship",
                type: "integer",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TurretsCount",
                table: "Ship",
                type: "integer",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ArmourMm",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "BattleshipShip_GunCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "BattleshipShip_TurretsCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "CarrierShip_GunCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "CruiserShip_GunCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "CruiserShip_TurretsCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "GunCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "PlaneCount",
                table: "Ship");

            migrationBuilder.DropColumn(
                name: "TurretsCount",
                table: "Ship");
        }
    }
}
