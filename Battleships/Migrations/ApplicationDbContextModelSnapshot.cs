﻿// <auto-generated />
using System;
using Battleships.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Battleships.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.9")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("Battleships.Models.Achievement", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<int>("ActionPerformedCount")
                        .HasColumnType("integer");

                    b.Property<string>("Description")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("RequiredAction")
                        .HasColumnType("text");

                    b.Property<int>("RequiredActionPerformedCount")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.ToTable("Achievements");
                });

            modelBuilder.Entity("Battleships.Models.ApplicationUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("text");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnType("integer");

                    b.Property<Guid?>("AchievementId")
                        .HasColumnType("uuid");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("text");

                    b.Property<string>("Email")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnType("boolean");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnType("boolean");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("text");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("text");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnType("boolean");

                    b.Property<string>("SecurityStamp")
                        .HasColumnType("text");

                    b.Property<string>("Surname")
                        .HasColumnType("text");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnType("boolean");

                    b.Property<string>("UserName")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.HasKey("Id");

                    b.HasIndex("AchievementId");

                    b.HasIndex("NormalizedEmail")
                        .HasDatabaseName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasDatabaseName("UserNameIndex");

                    b.ToTable("AspNetUsers", (string)null);
                });

            modelBuilder.Entity("Battleships.Models.Friend", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("User1")
                        .HasColumnType("uuid");

                    b.Property<Guid>("User2")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.ToTable("Friends");
                });

            modelBuilder.Entity("Battleships.Models.GameSession", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<int>("CurrentRound")
                        .HasColumnType("integer");

                    b.Property<DateTime>("DateCreated")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("EndgameStrategy")
                        .HasColumnType("text");

                    b.Property<TimeSpan>("GameLength")
                        .HasColumnType("interval");

                    b.Property<string>("Icon")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<int>("Status")
                        .HasColumnType("integer");

                    b.Property<string>("WinnerId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("WinnerId");

                    b.ToTable("GameSession");
                });

            modelBuilder.Entity("Battleships.Models.GameSessionSettings", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<int>("ColumnCount")
                        .HasColumnType("integer");

                    b.Property<int>("DestroyedShipCountForEndgame")
                        .HasColumnType("integer");

                    b.Property<int>("DestroyedShipsPercentageForEndgame")
                        .HasColumnType("integer");

                    b.Property<Guid>("GameSessionId")
                        .HasColumnType("uuid");

                    b.Property<int>("GameType")
                        .HasColumnType("integer");

                    b.Property<string>("GridSize")
                        .HasColumnType("text");

                    b.Property<int>("RoundCountLimitForEndgame")
                        .HasColumnType("integer");

                    b.Property<int>("RowCount")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("GameSessionId")
                        .IsUnique();

                    b.ToTable("GameSessionSettings");
                });

            modelBuilder.Entity("Battleships.Models.Player", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("GameSessionId")
                        .HasColumnType("uuid");

                    b.Property<bool>("IsCurrentPlayerTurn")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsHost")
                        .HasColumnType("boolean");

                    b.Property<string>("UserId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("GameSessionId");

                    b.HasIndex("UserId");

                    b.ToTable("Player");
                });

            modelBuilder.Entity("Battleships.Models.PlayerShip", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("PlayerId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("ShipId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("PlayerId");

                    b.HasIndex("ShipId");

                    b.ToTable("PlayerShip");
                });

            modelBuilder.Entity("Battleships.Models.Ships.Ship", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Description")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("ShipType")
                        .HasColumnType("text");

                    b.Property<string>("ShipTypeDiscriminator")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Ship");

                    b.HasDiscriminator<string>("ShipTypeDiscriminator").HasValue("Ship");
                });

            modelBuilder.Entity("Battleships.Models.ShipTile", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<bool>("IsDestroyed")
                        .HasColumnType("boolean");

                    b.Property<Guid>("PlayerShipId")
                        .HasColumnType("uuid");

                    b.Property<int>("XCoordinate")
                        .HasColumnType("integer");

                    b.Property<int>("YCoordinate")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("PlayerShipId");

                    b.ToTable("ShipTile");
                });

            modelBuilder.Entity("Battleships.Models.UserAchievement", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("AchievementId")
                        .HasColumnType("uuid");

                    b.Property<string>("UserId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("AchievementId");

                    b.HasIndex("UserId");

                    b.ToTable("UserAchievement");
                });

            modelBuilder.Entity("Battleships.Models.UserCosmetic", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Description")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<Guid?>("ShipId")
                        .HasColumnType("uuid");

                    b.Property<string>("UserId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("ShipId");

                    b.HasIndex("UserId");

                    b.ToTable("UserCosmetic");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("text");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256)
                        .HasColumnType("character varying(256)");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasDatabaseName("RoleNameIndex");

                    b.ToTable("AspNetRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<string>("ClaimType")
                        .HasColumnType("text");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("text");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<string>("ClaimType")
                        .HasColumnType("text");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("text");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("character varying(128)");

                    b.Property<string>("ProviderKey")
                        .HasMaxLength(128)
                        .HasColumnType("character varying(128)");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnType("text");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("text");

                    b.Property<string>("RoleId")
                        .HasColumnType("text");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("text");

                    b.Property<string>("LoginProvider")
                        .HasMaxLength(128)
                        .HasColumnType("character varying(128)");

                    b.Property<string>("Name")
                        .HasMaxLength(128)
                        .HasColumnType("character varying(128)");

                    b.Property<string>("Value")
                        .HasColumnType("text");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens", (string)null);
                });

            modelBuilder.Entity("Battleships.Models.Ships.BattleshipShip", b =>
                {
                    b.HasBaseType("Battleships.Models.Ships.Ship");

                    b.HasDiscriminator().HasValue("BattleshipShip");
                });

            modelBuilder.Entity("Battleships.Models.Ships.CarrierShip", b =>
                {
                    b.HasBaseType("Battleships.Models.Ships.Ship");

                    b.HasDiscriminator().HasValue("CarrierShip");
                });

            modelBuilder.Entity("Battleships.Models.Ships.CruiserShip", b =>
                {
                    b.HasBaseType("Battleships.Models.Ships.Ship");

                    b.HasDiscriminator().HasValue("CruiserShip");
                });

            modelBuilder.Entity("Battleships.Models.Ships.DestroyerShip", b =>
                {
                    b.HasBaseType("Battleships.Models.Ships.Ship");

                    b.HasDiscriminator().HasValue("DestroyerShip");
                });

            modelBuilder.Entity("Battleships.Models.Ships.SubmarineShip", b =>
                {
                    b.HasBaseType("Battleships.Models.Ships.Ship");

                    b.HasDiscriminator().HasValue("SubmarineShip");
                });

            modelBuilder.Entity("Battleships.Models.ApplicationUser", b =>
                {
                    b.HasOne("Battleships.Models.Achievement", null)
                        .WithMany("Users")
                        .HasForeignKey("AchievementId");
                });

            modelBuilder.Entity("Battleships.Models.GameSession", b =>
                {
                    b.HasOne("Battleships.Models.ApplicationUser", "Winner")
                        .WithMany("WonGames")
                        .HasForeignKey("WinnerId");

                    b.Navigation("Winner");
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

                    b.HasOne("Battleships.Models.Ships.Ship", "Ship")
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
                    b.HasOne("Battleships.Models.Ships.Ship", "Ship")
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

                    b.Navigation("WonGames");
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

            modelBuilder.Entity("Battleships.Models.Ships.Ship", b =>
                {
                    b.Navigation("PlayerShips");

                    b.Navigation("UserCosmetics");
                });
#pragma warning restore 612, 618
        }
    }
}
