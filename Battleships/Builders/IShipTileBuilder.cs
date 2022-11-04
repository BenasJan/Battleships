using System;
using Battleships.Models;
using Battleships.Models.enums;

namespace Battleships.Builders;

public interface IShipTileBuilder
{
    ShipTileBuilder WithXCoordinate(int x);
    ShipTileBuilder WithYCoordinate(int y);
    ShipTileBuilder WithIsDestroyed(bool isDestroyed);
    ShipTileBuilder WithPlayerShipId(Guid id);
    ShipTileBuilder WithPlayerShip(PlayerShip playerShip);
    ShipTileBuilder WithEngine(Engine engine);
    ShipTileBuilder WithGuns(Gun gun);
    ShipTileBuilder WithShield(bool shield);
    ShipTileBuilder WithGunCount(int gunCount);
    ShipTileBuilder WithIsFlagship(bool isFlagship);
    ShipTile Build();
}