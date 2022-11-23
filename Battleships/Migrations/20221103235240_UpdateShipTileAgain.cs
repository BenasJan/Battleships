using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class UpdateShipTileAgain : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_Player_OwnerPlayerId",
                table: "ShipTile");

            migrationBuilder.RenameColumn(
                name: "OwnerPlayerId",
                table: "ShipTile",
                newName: "TargetPlayerId");

            migrationBuilder.RenameIndex(
                name: "IX_ShipTile_OwnerPlayerId",
                table: "ShipTile",
                newName: "IX_ShipTile_TargetPlayerId");

            migrationBuilder.AddColumn<Guid>(
                name: "AttackerPlayerId",
                table: "ShipTile",
                type: "uuid",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ShipTile_AttackerPlayerId",
                table: "ShipTile",
                column: "AttackerPlayerId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_Player_AttackerPlayerId",
                table: "ShipTile",
                column: "AttackerPlayerId",
                principalTable: "Player",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_Player_TargetPlayerId",
                table: "ShipTile",
                column: "TargetPlayerId",
                principalTable: "Player",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_Player_AttackerPlayerId",
                table: "ShipTile");

            migrationBuilder.DropForeignKey(
                name: "FK_ShipTile_Player_TargetPlayerId",
                table: "ShipTile");

            migrationBuilder.DropIndex(
                name: "IX_ShipTile_AttackerPlayerId",
                table: "ShipTile");

            migrationBuilder.DropColumn(
                name: "AttackerPlayerId",
                table: "ShipTile");

            migrationBuilder.RenameColumn(
                name: "TargetPlayerId",
                table: "ShipTile",
                newName: "OwnerPlayerId");

            migrationBuilder.RenameIndex(
                name: "IX_ShipTile_TargetPlayerId",
                table: "ShipTile",
                newName: "IX_ShipTile_OwnerPlayerId");

            migrationBuilder.AddForeignKey(
                name: "FK_ShipTile_Player_OwnerPlayerId",
                table: "ShipTile",
                column: "OwnerPlayerId",
                principalTable: "Player",
                principalColumn: "Id");
        }
    }
}
