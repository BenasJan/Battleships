using Battleships.Data.Constants;
using System;
using System.Collections.Generic;

namespace Battleships.Flyweight
{
    public class ShipBaseDataFWFactory
    {
        private readonly Dictionary<string, ShipBaseData> _baseData;
        public ShipBaseData Create(string ShipType)
        {
            if (!_baseData.ContainsKey(ShipType))
            {
                switch (ShipType)
                {
                    case ShipTypes.Battleship:
                        _baseData.Add(ShipTypes.Battleship, new ShipBaseData("Battleship", "Standard battleship", ShipTypes.Battleship));
                        break;
                                            
                    case ShipTypes.Submarine:
                        _baseData.Add(ShipTypes.Submarine, new ShipBaseData("Submarine", "Standard sumbarine", ShipTypes.Submarine));
                        break;
                                            
                    case ShipTypes.Destroyer:
                        _baseData.Add(ShipTypes.Destroyer, new ShipBaseData("Destroyer", "Standard destroyer", ShipTypes.Destroyer));
                        break;
                                            
                    default:
                        throw new Exception("Unknown ship type");
                }
            }

            return _baseData[ShipType];
        }
    }
}