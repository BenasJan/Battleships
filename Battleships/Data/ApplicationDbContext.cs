using Battleships.Models;
using Battleships.Models.Ships;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public DbSet<Achievement> Achievements { get; set; }
        public DbSet<Friend> Friends { get; set; }
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Ship>()
                .HasDiscriminator(ship => ship.ShipTypeDiscriminator)
                .HasValue<BattleshipShip>(nameof(BattleshipShip))
                .HasValue<CarrierShip>(nameof(CarrierShip))
                .HasValue<CruiserShip>(nameof(CruiserShip))
                .HasValue<DestroyerShip>(nameof(DestroyerShip))
                .HasValue<SubmarineShip>(nameof(SubmarineShip))
                ;
            
            base.OnModelCreating(builder);
        }
    }
}