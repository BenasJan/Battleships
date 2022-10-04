﻿// <auto-generated />
using System;
using Battleships.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Battleships.Data.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "5.0.14");

            modelBuilder.Entity("Battleships.Models.Achievement", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<int>("ActionPerformedCount")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("RequiredAction")
                        .HasColumnType("TEXT");

                    b.Property<int>("RequiredActionPerformedCount")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.ToTable("Achievements");

                    b.HasData(
                        new
                        {
                            Id = new Guid("7e864ca7-2736-49d6-a733-9150b1693de5"),
                            ActionPerformedCount = 0,
                            Description = "Hit your first piece of a ship",
                            Name = "First blood",
                            RequiredAction = "Shoot a ship",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("c3c39233-588d-403b-8444-176dc17a1cbe"),
                            ActionPerformedCount = 0,
                            Description = "Win your first match",
                            Name = "First Win",
                            RequiredAction = "Win match",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("241de7b9-af56-4664-83c9-f6fe4294a1b3"),
                            ActionPerformedCount = 0,
                            Description = "Get hit by an enemy player for the first time",
                            Name = "Get hit",
                            RequiredAction = "Get one of your ships damaged",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("fb03e03f-b989-4a87-926f-55b7d74df038"),
                            ActionPerformedCount = 0,
                            Description = "Have your shot miss any enemy ship",
                            Name = "Miss",
                            RequiredAction = "Shoot an empty tile",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("915efd4f-18ac-41ac-a743-f4ca4da98945"),
                            ActionPerformedCount = 0,
                            Description = "Win five times against an enemy player",
                            Name = "Fiver win",
                            RequiredAction = "Win 5 times",
                            RequiredActionPerformedCount = 5
                        },
                        new
                        {
                            Id = new Guid("34574fd2-5115-40a9-917c-2d4137e0863e"),
                            ActionPerformedCount = 0,
                            Description = "Lose five times against an enemy player",
                            Name = "Loser",
                            RequiredAction = "Lose 5 times",
                            RequiredActionPerformedCount = 5
                        },
                        new
                        {
                            Id = new Guid("4755f58f-5964-4908-ba32-ca00d4532419"),
                            ActionPerformedCount = 0,
                            Description = "Lose against an enemy player",
                            Name = "Its okay",
                            RequiredAction = "Lose match",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("3022194d-d137-4ddb-89b0-68ce1842428c"),
                            ActionPerformedCount = 0,
                            Description = "Start your first match",
                            Name = "Lets go",
                            RequiredAction = "Start match",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("fc228190-f4fe-4777-905b-20e6cfbb5532"),
                            ActionPerformedCount = 0,
                            Description = "End a match before it ends",
                            Name = "Quitter",
                            RequiredAction = "Cancel match",
                            RequiredActionPerformedCount = 1
                        },
                        new
                        {
                            Id = new Guid("3a1a9b33-457b-4cd4-bc61-894d63e3a653"),
                            ActionPerformedCount = 0,
                            Description = "Win 10 matches",
                            Name = "Ten fingers",
                            RequiredAction = "Win 10 Matches",
                            RequiredActionPerformedCount = 10
                        });
                });

            modelBuilder.Entity("Battleships.Models.ApplicationUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("TEXT");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnType("INTEGER");

                    b.Property<Guid?>("AchievementId")
                        .HasColumnType("TEXT");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnType("INTEGER");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnType("INTEGER");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("TEXT");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("TEXT");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnType("INTEGER");

                    b.Property<string>("SecurityStamp")
                        .HasColumnType("TEXT");

                    b.Property<string>("Surname")
                        .HasColumnType("TEXT");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UserName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("AchievementId");

                    b.HasIndex("NormalizedEmail")
                        .HasDatabaseName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasDatabaseName("UserNameIndex");

                    b.ToTable("AspNetUsers");
                });

            modelBuilder.Entity("Battleships.Models.GameSession", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Icon")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("GameSession");
                });

            modelBuilder.Entity("Battleships.Models.GameSessionSettings", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("GameSessionId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("GameSessionId")
                        .IsUnique();

                    b.ToTable("GameSessionSettings");
                });

            modelBuilder.Entity("Battleships.Models.Player", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("GameSessionId")
                        .HasColumnType("TEXT");

                    b.Property<bool>("IsHost")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("GameSessionId");

                    b.HasIndex("UserId");

                    b.ToTable("Player");
                });

            modelBuilder.Entity("Battleships.Models.PlayerShip", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("PlayerId")
                        .HasColumnType("TEXT");

                    b.Property<Guid>("ShipId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("PlayerId");

                    b.HasIndex("ShipId");

                    b.ToTable("PlayerShip");
                });

            modelBuilder.Entity("Battleships.Models.Ship", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Ship");
                });

            modelBuilder.Entity("Battleships.Models.ShipTile", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<bool>("IsDestroyed")
                        .HasColumnType("INTEGER");

                    b.Property<Guid>("PlayerShipId")
                        .HasColumnType("TEXT");

                    b.Property<int>("XCoordinate")
                        .HasColumnType("INTEGER");

                    b.Property<int>("YCoordinate")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.HasIndex("PlayerShipId");

                    b.ToTable("ShipTile");
                });

            modelBuilder.Entity("Battleships.Models.UserAchievement", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<Guid>("AchievementId")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("AchievementId");

                    b.HasIndex("UserId");

                    b.ToTable("UserAchievement");
                });

            modelBuilder.Entity("Battleships.Models.UserCosmetic", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("TEXT");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<Guid?>("ShipId")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("ShipId");

                    b.HasIndex("UserId");

                    b.ToTable("UserCosmetic");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("TEXT");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256)
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasDatabaseName("RoleNameIndex");

                    b.ToTable("AspNetRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("ClaimType")
                        .HasColumnType("TEXT");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("TEXT");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("ClaimType")
                        .HasColumnType("TEXT");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.Property<string>("RoleId")
                        .HasColumnType("TEXT");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("TEXT");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasMaxLength(128)
                        .HasColumnType("TEXT");

                    b.Property<string>("Value")
                        .HasColumnType("TEXT");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens");
                });

            modelBuilder.Entity("Battleships.Models.ApplicationUser", b =>
                {
                    b.HasOne("Battleships.Models.Achievement", null)
                        .WithMany("Users")
                        .HasForeignKey("AchievementId");
                });

            modelBuilder.Entity("Battleships.Models.GameSessionSettings", b =>
                {
                    b.HasOne("Battleships.Models.GameSession", "GameSession")
                        .WithOne("Settings")
                        .HasForeignKey("Battleships.Models.GameSessionSettings", "GameSessionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("GameSession");
                });

            modelBuilder.Entity("Battleships.Models.Player", b =>
                {
                    b.HasOne("Battleships.Models.GameSession", "GameSession")
                        .WithMany("Players")
                        .HasForeignKey("GameSessionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Battleships.Models.ApplicationUser", "User")
                        .WithMany("Players")
                        .HasForeignKey("UserId");

                    b.Navigation("GameSession");

                    b.Navigation("User");
                });

            modelBuilder.Entity("Battleships.Models.PlayerShip", b =>
                {
                    b.HasOne("Battleships.Models.Player", "Player")
                        .WithMany("PlayerShips")
                        .HasForeignKey("PlayerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Battleships.Models.Ship", "Ship")
                        .WithMany("PlayerShips")
                        .HasForeignKey("ShipId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Player");

                    b.Navigation("Ship");
                });

            modelBuilder.Entity("Battleships.Models.ShipTile", b =>
                {
                    b.HasOne("Battleships.Models.PlayerShip", "PlayerShip")
                        .WithMany("Tiles")
                        .HasForeignKey("PlayerShipId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("PlayerShip");
                });

            modelBuilder.Entity("Battleships.Models.UserAchievement", b =>
                {
                    b.HasOne("Battleships.Models.Achievement", "Achievement")
                        .WithMany()
                        .HasForeignKey("AchievementId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Battleships.Models.ApplicationUser", "User")
                        .WithMany("UserAchievements")
                        .HasForeignKey("UserId");

                    b.Navigation("Achievement");

                    b.Navigation("User");
                });

            modelBuilder.Entity("Battleships.Models.UserCosmetic", b =>
                {
                    b.HasOne("Battleships.Models.Ship", "Ship")
                        .WithMany("UserCosmetics")
                        .HasForeignKey("ShipId");

                    b.HasOne("Battleships.Models.ApplicationUser", "User")
                        .WithMany("Cosmetics")
                        .HasForeignKey("UserId");

                    b.Navigation("Ship");

                    b.Navigation("User");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Battleships.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Battleships.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Battleships.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Battleships.Models.ApplicationUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Battleships.Models.Achievement", b =>
                {
                    b.Navigation("Users");
                });

            modelBuilder.Entity("Battleships.Models.ApplicationUser", b =>
                {
                    b.Navigation("Cosmetics");

                    b.Navigation("Players");

                    b.Navigation("UserAchievements");
                });

            modelBuilder.Entity("Battleships.Models.GameSession", b =>
                {
                    b.Navigation("Players");

                    b.Navigation("Settings");
                });

            modelBuilder.Entity("Battleships.Models.Player", b =>
                {
                    b.Navigation("PlayerShips");
                });

            modelBuilder.Entity("Battleships.Models.PlayerShip", b =>
                {
                    b.Navigation("Tiles");
                });

            modelBuilder.Entity("Battleships.Models.Ship", b =>
                {
                    b.Navigation("PlayerShips");

                    b.Navigation("UserCosmetics");
                });
#pragma warning restore 612, 618
        }
    }
}
