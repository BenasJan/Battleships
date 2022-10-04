using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Battleships.Data.Migrations
{
    public partial class AddGameTiles : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ShipTile",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    XCoordinate = table.Column<int>(type: "INTEGER", nullable: false),
                    YCoordinate = table.Column<int>(type: "INTEGER", nullable: false),
                    IsDestroyed = table.Column<bool>(type: "INTEGER", nullable: false),
                    PlayerShipId = table.Column<Guid>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ShipTile", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ShipTile_PlayerShip_PlayerShipId",
                        column: x => x.PlayerShipId,
                        principalTable: "PlayerShip",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ShipTile_PlayerShipId",
                table: "ShipTile",
                column: "PlayerShipId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ShipTile");
        }
    }
}
