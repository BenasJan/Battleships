﻿using Battleships.Models;
using Battleships.Models.Ships;
using System.Collections.Generic;

namespace Battleships.Decorators
{
    public class ShipAppearance : PlayerShip, IShipAppearance
    {
        public string Label { get; set; }
        public string Skin { get; set; }
        public List<string> Info { get; set; }
        public ShipAppearance Draw()
        {
            return null;
        }
    }
}
