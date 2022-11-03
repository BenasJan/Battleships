using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class UpdateShipTile : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_PlayerShip_PlayerShipId",
                table: "ShipTile");

            migrationBuilder.AlterColumn<Guid>(
                name: "PlayerShipId",
                table: "ShipTile",
                type: "uuid",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uuid");

            migrationBuilder.AddColumn<Guid>(
                name: "OwnerPlayerId",
                table: "ShipTile",
                type: "uuid",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ShipTile_OwnerPlayerId",
                table: "ShipTile",
                column: "OwnerPlayerId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_Player_OwnerPlayerId",
                table: "ShipTile",
                column: "OwnerPlayerId",
                principalTable: "Player",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_PlayerShip_PlayerShipId",
                table: "ShipTile",
                column: "PlayerShipId",
                principalTable: "PlayerShip",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_Player_OwnerPlayerId",
                table: "ShipTile");

            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_PlayerShip_PlayerShipId",
                table: "ShipTile");

            migrationBuilder.DropIndex(
                name: "IX_ShipTile_OwnerPlayerId",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "OwnerPlayerId",
                table: "ShipTile");

            migrationBuilder.AlterColumn<Guid>(
                name: "PlayerShipId",
                table: "ShipTile",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uuid",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_PlayerShip_PlayerShipId",
                table: "ShipTile",
                column: "PlayerShipId",
                principalTable: "PlayerShip",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
