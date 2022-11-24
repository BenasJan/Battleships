using System;
using System.Collections.Generic;
using Battleships.Data.Constants;
using Battleships.Factories;
using Battleships.Models.Ships;
using Battleships.Repositories;
using Microsoft.Extensions.DependencyInjection;

namespace Battleships.Data
{
    public class ShipSeeder
    {
        public static void SeedShips(IServiceProvider serviceProvider)
        {
            using var serviceScope = serviceProvider.CreateScope();
            var battleshipsDatabase = serviceScope.ServiceProvider.GetRequiredService<IBattleshipsDatabase>();
            var isEmpty = battleshipsDatabase.ShipsRepository.IsEmpty();

            if (isEmpty)
            {
                var factoryProducer = new ShipFactoryProducer();
                var neutralShipFactory = factoryProducer.ProduceFactory(null);
                var defensiveShipsFactory = factoryProducer.ProduceFactory(true);
                var offensiveShipsFactory = factoryProducer.ProduceFactory(false);

                var ships = new List<Ship>()
                {
                    defensiveShipsFactory.GenerateShip(ShipTypes.Carrier),
                    defensiveShipsFactory.GenerateShip(ShipTypes.Cruiser),
                    offensiveShipsFactory.GenerateShip(ShipTypes.Battleship),
                    offensiveShipsFactory.GenerateShip(ShipTypes.Destroyer),
                    offensiveShipsFactory.GenerateShip(ShipTypes.Submarine),
                    neutralShipFactory.GenerateShip(ShipTypes.Dummy)
                };    
            
                battleshipsDatabase.ShipsRepository.CreateMany(ships).Wait();
            }
        }
    }
}