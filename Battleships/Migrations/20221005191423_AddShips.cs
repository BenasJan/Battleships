using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class AddShips : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "ShipId",
                table: "ShipTile",
                type: "uuid",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ShipTypeDiscriminator",
                table: "Ship",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_ShipTile_ShipId",
                table: "ShipTile",
                column: "ShipId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_Ship_ShipId",
                table: "ShipTile",
                column: "ShipId",
                principalTable: "Ship",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_Ship_ShipId",
                table: "ShipTile");

            migrationBuilder.DropIndex(
                name: "IX_ShipTile_ShipId",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "ShipId",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "ShipTypeDiscriminator",
                table: "Ship");
        }
    }
}
