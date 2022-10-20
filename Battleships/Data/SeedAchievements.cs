using System;
using System.Collections.Generic;
using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Models.Ships;
using Battleships.Prototype;
using Battleships.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Battleships.Data
{
    public static class SeedAchievements
    {
        public static void SeedAchs(IServiceProvider serviceProvider)
        {
            using var serviceScope = serviceProvider.CreateScope();
            var battleshipsDatabase = serviceScope.ServiceProvider.GetRequiredService<IBattleshipsDatabase>();
            var isEmpty = battleshipsDatabase.AchievementsRepository.IsEmpty();

            if (isEmpty)
            {
                var achievementManager = new AchievementManager();
                CloneAchievements(achievementManager);

                var achievements = new List<Achievement>()
                {
                    achievementManager["fb"] as Achievement,
                    achievementManager["fw"] as Achievement,
                    achievementManager["gh"] as Achievement,
                    achievementManager["m"] as Achievement,
                    achievementManager["fvw"] as Achievement,
                    achievementManager["l"] as Achievement,
                    achievementManager["io"] as Achievement,
                    achievementManager["lg"] as Achievement,
                    achievementManager["q"] as Achievement,
                    achievementManager["tf"] as Achievement
                };

                battleshipsDatabase.AchievementsRepository.CreateMany(achievements).Wait();
            }
        }

        private static void CloneAchievements(AchievementManager achievementManager)
        {
            achievementManager["fb"] = new Achievement
            {
                Id = Guid.Parse("7e864ca7-2736-49d6-a733-9150b1693de5"),
                Name = "First blood",
                Description = "Hit your first piece of a ship",
                RequiredAction = "Shoot a ship",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["fw"] = new Achievement
            {
                Id = Guid.Parse("c3c39233-588d-403b-8444-176dc17a1cbe"),
                Name = "First Win",
                Description = "Win your first match",
                RequiredAction = "Win match",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["gh"] = new Achievement
            {
                Id = Guid.Parse("241de7b9-af56-4664-83c9-f6fe4294a1b3"),
                Name = "Get hit",
                Description = "Get hit by an enemy player for the first time",
                RequiredAction = "Get one of your ships damaged",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["m"] = new Achievement
            {
                Id = Guid.Parse("fb03e03f-b989-4a87-926f-55b7d74df038"),
                Name = "Miss",
                Description = "Have your shot miss any enemy ship",
                RequiredAction = "Shoot an empty tile",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["fvw"] = new Achievement
            {
                Id = Guid.Parse("915efd4f-18ac-41ac-a743-f4ca4da98945"),
                Name = "Fiver win",
                Description = "Win five times against an enemy player",
                RequiredAction = "Win 5 times",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 5
            };

            achievementManager["l"] = new Achievement
            {
                Id = Guid.Parse("34574fd2-5115-40a9-917c-2d4137e0863e"),
                Name = "Loser",
                Description = "Lose five times against an enemy player",
                RequiredAction = "Lose 5 times",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 5
            };

            achievementManager["io"] = new Achievement
            {
                Id = Guid.Parse("4755f58f-5964-4908-ba32-ca00d4532419"),
                Name = "Its okay",
                Description = "Lose against an enemy player",
                RequiredAction = "Lose match",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["lg"] = new Achievement
            {
                Id = Guid.Parse("3022194d-d137-4ddb-89b0-68ce1842428c"),
                Name = "Lets go",
                Description = "Start your first match",
                RequiredAction = "Start match",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["q"] = new Achievement
            {
                Id = Guid.Parse("fc228190-f4fe-4777-905b-20e6cfbb5532"),
                Name = "Quitter",
                Description = "End a match before it ends",
                RequiredAction = "Cancel match",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 1
            };

            achievementManager["tf"] = new Achievement
            {
                Id = Guid.Parse("3a1a9b33-457b-4cd4-bc61-894d63e3a653"),
                Name = "Ten fingers",
                Description = "Win 10 matches",
                RequiredAction = "Win 10 Matches",
                ActionPerformedCount = 0,
                RequiredActionPerformedCount = 10
            };

            achievementManager["fake"] = new Achievement
            {
                Id = Guid.Parse("3a1a9b33-457b-4cd4-bc61-894d63e3aaaa"),
                Name = "what",
                Description = "something",
                RequiredAction = "i dont know",
                ActionPerformedCount = 1000,
                RequiredActionPerformedCount = 0
            };
        }
    }
}
