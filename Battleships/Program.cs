using Battleships.Iterator;
using Battleships.Iterator.ShipTiles;
using Battleships.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Models.Ships;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace Battleships
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            //ShipTileCollection collection = new ShipTileCollection();

            //collection[0] = new ShipTile() { XCoordinate = 1, IsDestroyed = true };
            //collection[1] = new ShipTile() { XCoordinate = 2, IsDestroyed = true };
            //collection[2] = new ShipTile() { XCoordinate = 3, IsDestroyed = false };
            //collection[3] = new ShipTile() { XCoordinate = 4, IsDestroyed = true };
            //collection[4] = new ShipTile() { XCoordinate = 5, IsDestroyed = true };
            //collection[5] = new ShipTile() { XCoordinate = 6, IsDestroyed = false };

            //// Create iterator
            //ShipTileIterator iterator = new ShipTileIterator(collection);
            //Console.WriteLine("Items by iterating over collection");

            ShipCollection collection = new ShipCollection();

            collection[0] = new PlayerShip()
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000001"),
                Tiles = new List<ShipTile>()
                { new ShipTile() { IsDestroyed = true },
                    new ShipTile() { IsDestroyed = true },
                    new ShipTile() { IsDestroyed = true },
                }
            };
            collection[1] = new PlayerShip()
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000002"),
                Tiles = new List<ShipTile>()
                { new ShipTile() { IsDestroyed = true },
                    new ShipTile() { IsDestroyed = false },
                    new ShipTile() { IsDestroyed = true },
                }
            };
            collection[2] = new PlayerShip()
            {
                Id = Guid.Parse("00000000-0000-0000-0000-000000000003"),
                Tiles = new List<ShipTile>()
                { new ShipTile() { IsDestroyed = true },
                    new ShipTile() { IsDestroyed = true },
                    new ShipTile() { IsDestroyed = true },
                }
            };

            // Create iterator
            ShipIterator iterator = new ShipIterator(collection);
            Console.WriteLine("Items by iterating over collection");

            for (PlayerShip item = iterator.First(); !iterator.IsDone; item = iterator.NextDestroyed())
            {
                Debug.WriteLine(item.Id);
            }

            TestMementoNew();
            //TestMemento();

            CreateHostBuilder(args).Build().Run();
        }

        private static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder => { webBuilder.UseStartup<Startup>(); });


        public static void TestMementoNew()
        {
            List<PlayerShip> savedShipTiles = new List<PlayerShip>();

            PlayerShip.Originator originator = new PlayerShip.Originator();

            var neutralShipFactory = new NeutralShipFactory();
            PlayerShip testPlayerShip = new PlayerShip()
            {
                ShipId = new Guid(),
                Ship = neutralShipFactory.GenerateShip("Dummy"),
                Tiles = new List<ShipTile>()
                {
                    new() { XCoordinate = 4, YCoordinate = 5 },
                    new() { XCoordinate = 5, YCoordinate = 5 },
                    new() { XCoordinate = 6, YCoordinate = 5 },
                }
            };

            originator.Set(testPlayerShip.Tiles);
            savedShipTiles.Add(originator.SaveToMemento());
            testPlayerShip.MoveDown();
            originator.Set(testPlayerShip.Tiles);
            savedShipTiles.Add(originator.SaveToMemento());
            testPlayerShip.MoveDown();
            originator.Set(testPlayerShip.Tiles);
            savedShipTiles.Add(originator.SaveToMemento());
            testPlayerShip.MoveDown();
            originator.Set(testPlayerShip.Tiles);

            originator.RestoreFromMemento(savedShipTiles[0]);
            originator.RestoreFromMemento(savedShipTiles[2]);
        }

        //public static void TestMemento()
        //{
        //    Debug.WriteLine("Memento start");

        //    var neutralShipFactory = new NeutralShipFactory();

        //    PlayerShip playerShip = new PlayerShip()
        //    {
        //        ShipId = new Guid(),
        //        Ship = neutralShipFactory.GenerateShip("Dummy"),
        //        Tiles = new List<ShipTile>()
        //        {
        //            new() { XCoordinate = 4, YCoordinate = 5 },
        //            new() { XCoordinate = 5, YCoordinate = 5 },
        //            new() { XCoordinate = 6, YCoordinate = 5 },
        //        }
        //    };
        //    playerShip.PrintShipTiles();
        //    playerShip.PrintShipTilesMemory();

        //    Debug.WriteLine("\n");

        //    playerShip.MoveDown();
        //    Debug.WriteLine("Moved down");
        //    playerShip.MoveRight();
        //    Debug.WriteLine("Moved right");            
        //    playerShip.MoveDown();
        //    Debug.WriteLine("Moved down");

        //    playerShip.PrintShipTiles();
        //    playerShip.PrintShipTilesMemory();

        //    playerShip.UndoMove();
        //    Debug.WriteLine("Undone move");            
        //    playerShip.UndoMove();
        //    Debug.WriteLine("Undone move");

        //    playerShip.PrintShipTiles();
        //    playerShip.PrintShipTilesMemory();

        //}
    }
}