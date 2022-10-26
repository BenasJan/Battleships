using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Battleships.Migrations
{
    public partial class fixes : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "WinnerId",
                table: "GameSession",
                type: "text",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uuid");

            migrationBuilder.AddColumn<int>(
                name: "CurrentRound",
                table: "GameSession",
                type: "integer",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "EndgameStrategy",
                table: "GameSession",
                type: "text",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsOver",
                table: "GameSession",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateIndex(
                name: "IX_GameSession_WinnerId",
                table: "GameSession",
                column: "WinnerId");

            migrationBuilder.AddForeignKey(
                name: "FK_GameSession_AspNetUsers_WinnerId",
                table: "GameSession",
                column: "WinnerId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_GameSession_AspNetUsers_WinnerId",
                table: "GameSession");

            migrationBuilder.DropIndex(
                name: "IX_GameSession_WinnerId",
                table: "GameSession");

            migrationBuilder.DropColumn(
                name: "CurrentRound",
                table: "GameSession");

            migrationBuilder.DropColumn(
                name: "EndgameStrategy",
                table: "GameSession");

            migrationBuilder.DropColumn(
                name: "IsOver",
                table: "GameSession");

            migrationBuilder.AlterColumn<Guid>(
                name: "WinnerId",
                table: "GameSession",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);
        }
    }
}
