using System.ComponentModel.DataAnnotations;
using System;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Flyweight
{
    public class ShipBaseData : BaseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public string ShipType { get; set; }        
        public ShipBaseData(string name, string description, string shipType)
        {
            Name = name;
            Description = description;
            ShipType = shipType;
        }
    }
}
