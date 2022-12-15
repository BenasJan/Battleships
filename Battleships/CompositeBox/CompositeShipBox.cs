using System;
using System.Collections.Generic;
using System.Linq;
using Battleships.Models.Ships;

namespace Battleships.CompositeBox;

public class CompositeShipBox : ShipBox
{
    private readonly List<Ship> children = new List<Ship>();

    public CompositeShipBox(List<Ship> ships)
    {
        children.AddRange(ships);
    }

    public int CalculateGuns()
    {
        Console.WriteLine("Total guns: " + children.Select(x => x.CalculateGuns()).Sum());
        return children.Select(x => x.CalculateGuns()).Sum();
    }

    public int CalculateWeight()
    {
        Console.WriteLine("Total weight: " + children.Select(x => x.CalculateWeight()).Sum());

        return children.Select(x => x.CalculateWeight()).Sum();
    }
}