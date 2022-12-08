using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Models.Ships;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Battleships
{
    public static class Program
    {
        public static void Main(string[] args)
        {
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

        public static void TestMemento()
        {
            Debug.WriteLine("Memento start");

            var neutralShipFactory = new NeutralShipFactory();

            PlayerShip playerShip = new PlayerShip()
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
            playerShip.PrintShipTiles();
            playerShip.PrintShipTilesMemory();

            Debug.WriteLine("\n");

            playerShip.MoveDown();
            Debug.WriteLine("Moved down");
            playerShip.MoveRight();
            Debug.WriteLine("Moved right");            
            playerShip.MoveDown();
            Debug.WriteLine("Moved down");

            playerShip.PrintShipTiles();
            playerShip.PrintShipTilesMemory();

            playerShip.UndoMove();
            Debug.WriteLine("Undone move");            
            playerShip.UndoMove();
            Debug.WriteLine("Undone move");

            playerShip.PrintShipTiles();
            playerShip.PrintShipTilesMemory();

        }
    }
}