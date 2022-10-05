using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Battleships.Data.Migrations
{
    public partial class SeedAchievementTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievement_AspNetUsers_UserId",
                table: "Achievement");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Achievement",
                table: "Achievement");

            migrationBuilder.DropIndex(
                name: "IX_Achievement_UserId",
                table: "Achievement");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Achievement");

            migrationBuilder.RenameTable(
                name: "Achievement",
                newName: "Achievements");

            migrationBuilder.AddColumn<Guid>(
                name: "AchievementId",
                table: "AspNetUsers",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Achievements",
                table: "Achievements",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "UserAchievement",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "TEXT", nullable: false),
                    AchievementId = table.Column<Guid>(type: "TEXT", nullable: false),
                    UserId = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserAchievement", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserAchievement_Achievements_AchievementId",
                        column: x => x.AchievementId,
                        principalTable: "Achievements",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserAchievement_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("7e864ca7-2736-49d6-a733-9150b1693de5"), 0, "Hit your first piece of a ship", "First blood", "Shoot a ship", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("c3c39233-588d-403b-8444-176dc17a1cbe"), 0, "Win your first match", "First Win", "Win match", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("241de7b9-af56-4664-83c9-f6fe4294a1b3"), 0, "Get hit by an enemy player for the first time", "Get hit", "Get one of your ships damaged", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("fb03e03f-b989-4a87-926f-55b7d74df038"), 0, "Have your shot miss any enemy ship", "Miss", "Shoot an empty tile", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("915efd4f-18ac-41ac-a743-f4ca4da98945"), 0, "Win five times against an enemy player", "Fiver win", "Win 5 times", 5 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("34574fd2-5115-40a9-917c-2d4137e0863e"), 0, "Lose five times against an enemy player", "Loser", "Lose 5 times", 5 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("4755f58f-5964-4908-ba32-ca00d4532419"), 0, "Lose against an enemy player", "Its okay", "Lose match", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("3022194d-d137-4ddb-89b0-68ce1842428c"), 0, "Start your first match", "Lets go", "Start match", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("fc228190-f4fe-4777-905b-20e6cfbb5532"), 0, "End a match before it ends", "Quitter", "Cancel match", 1 });

            migrationBuilder.InsertData(
                table: "Achievements",
                columns: new[] { "Id", "ActionPerformedCount", "Description", "Name", "RequiredAction", "RequiredActionPerformedCount" },
                values: new object[] { new Guid("3a1a9b33-457b-4cd4-bc61-894d63e3a653"), 0, "Win 10 matches", "Ten fingers", "Win 10 Matches", 10 });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_AchievementId",
                table: "AspNetUsers",
                column: "AchievementId");

            migrationBuilder.CreateIndex(
                name: "IX_UserAchievement_AchievementId",
                table: "UserAchievement",
                column: "AchievementId");

            migrationBuilder.CreateIndex(
                name: "IX_UserAchievement_UserId",
                table: "UserAchievement",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Achievements_AchievementId",
                table: "AspNetUsers",
                column: "AchievementId",
                principalTable: "Achievements",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Achievements_AchievementId",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "UserAchievement");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_AchievementId",
                table: "AspNetUsers");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Achievements",
                table: "Achievements");

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("241de7b9-af56-4664-83c9-f6fe4294a1b3"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("3022194d-d137-4ddb-89b0-68ce1842428c"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("34574fd2-5115-40a9-917c-2d4137e0863e"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("3a1a9b33-457b-4cd4-bc61-894d63e3a653"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("4755f58f-5964-4908-ba32-ca00d4532419"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("7e864ca7-2736-49d6-a733-9150b1693de5"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("915efd4f-18ac-41ac-a743-f4ca4da98945"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("c3c39233-588d-403b-8444-176dc17a1cbe"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("fb03e03f-b989-4a87-926f-55b7d74df038"));

            migrationBuilder.DeleteData(
                table: "Achievements",
                keyColumn: "Id",
                keyValue: new Guid("fc228190-f4fe-4777-905b-20e6cfbb5532"));

            migrationBuilder.DropColumn(
                name: "AchievementId",
                table: "AspNetUsers");

            migrationBuilder.RenameTable(
                name: "Achievements",
                newName: "Achievement");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Achievement",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Achievement",
                table: "Achievement",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_Achievement_UserId",
                table: "Achievement",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievement_AspNetUsers_UserId",
                table: "Achievement",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
