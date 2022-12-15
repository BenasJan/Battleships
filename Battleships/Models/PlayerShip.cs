using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using Battleships.Models.Ships;
using Newtonsoft.Json;

namespace Battleships.Models
{
    public class PlayerShip : BaseModel
    {
        [NotMapped]
        private List<List<ShipTile>> shipTilesMemory = new();
        public Guid PlayerId { get; set; }
        public Player Player { get; set; }

        public Guid ShipId { get; set; }
        public Ship Ship { get; set; }

        public List<ShipTile> Tiles { get; set; }
        public PlayerShip() { }
        private PlayerShip(List<ShipTile> shipTiles)
        {
            this.Tiles = shipTiles;
        }

        public class Originator
        {
            private List<ShipTile> Tiles;

            public void Set (List<ShipTile> shipTiles)
            {
                Debug.WriteLine("Originator: Setting ShipTiles to: ");
                PrintShipTiles(shipTiles);
                this.Tiles = shipTiles;
            }

            public PlayerShip SaveToMemento()
            {
                Debug.WriteLine("Originator: Saving to Memento.");
                return new PlayerShip(CopyTiles(Tiles));
            }

            public void RestoreFromMemento(PlayerShip playerShip)
            {
                Tiles = playerShip.Tiles;
                Debug.WriteLine("Originator: ShipTiles after restoring from Memento: ");
                PrintShipTiles(Tiles);

            }
        }

        public void MoveUp()
        {
            List<ShipTile> temp = GetCurrentTiles();
            this.shipTilesMemory.Add(temp);

            foreach (var tile in this.Tiles)
            {
                tile.YCoordinate += 1;
            }
        }        
        public void MoveDown()
        {
            List<ShipTile> temp = GetCurrentTiles();
            this.shipTilesMemory.Add(temp);

            foreach (var tile in this.Tiles)
            {
                tile.YCoordinate -= 1;
            }
        }
        public void MoveLeft()
        {
            List<ShipTile> temp = GetCurrentTiles();
            this.shipTilesMemory.Add(temp);

            foreach (var tile in this.Tiles)
            {
                tile.XCoordinate -= 1;
            }
        }
        public void MoveRight()
        {
            List<ShipTile> temp = GetCurrentTiles();
            this.shipTilesMemory.Add(temp);

            foreach (var tile in this.Tiles)
            {
                tile.XCoordinate += 1;
            }
        }

        //public void UndoMove()
        //{
        //    var prevTiles = this.shipTilesMemory.Last();
        //    if(prevTiles != null)
        //    {
        //        this.Tiles = prevTiles;
        //        this.shipTilesMemory.Remove(prevTiles);
        //    }
        //}

        public List<ShipTile> GetCurrentTiles()
        {
            var serializedTiles = JsonConvert.SerializeObject(this.Tiles);
            return JsonConvert.DeserializeObject<List<ShipTile>>(serializedTiles);
        }        
        
        public static List<ShipTile> CopyTiles(List<ShipTile> shipTiles)
        {
            var serializedTiles = JsonConvert.SerializeObject(shipTiles);
            return JsonConvert.DeserializeObject<List<ShipTile>>(serializedTiles);
        }

        public static void PrintShipTiles(List<ShipTile> shipTiles)
        {
            Debug.WriteLine("X, Y coordinates");
            foreach (var tile in shipTiles)
            {
                Debug.WriteLine($"{tile.XCoordinate}, {tile.YCoordinate}");
            }
        }

        //public void PrintShipTilesMemory()
        //{
        //    Debug.WriteLine("\nPrinting ShipTiles memory:");
        //    var cnt = 1;

        //    foreach (var shipTiles in this.shipTilesMemory)
        //    {
        //        Debug.WriteLine($"ShipTiles memory step {cnt}:");
        //        cnt++;

        //        Debug.WriteLine("X, Y coordinates");
        //        foreach (var tile in shipTiles)
        //        {
        //            Debug.WriteLine($"{tile.XCoordinate}, {tile.YCoordinate}");
        //        }
        //    }
        //}
        //public void PrintShipTiles()
        //{
        //    Debug.WriteLine("\nPrinting current ShipTiles:");
        //    Debug.WriteLine("X, Y coordinates");
        //    foreach (var tile in this.Tiles)
        //    {
        //        Debug.WriteLine($"{tile.XCoordinate}, {tile.YCoordinate}");
        //    }
        //}        

    }
}