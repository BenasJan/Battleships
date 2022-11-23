using System;
using Battleships.Models;
using Battleships.Models.enums;

namespace Battleships.Builders;

public class ShipTileBuilder : IShipTileBuilder
{
    private readonly ShipTile _shipTile = new ShipTile();
    
    public ShipTileBuilder WithXCoordinate(int x)
    {
        _shipTile.XCoordinate = x;
        return this;
    }

    public ShipTileBuilder WithYCoordinate(int y)
    {
        _shipTile.YCoordinate = y;
        return this;
    }

    public ShipTileBuilder WithIsDestroyed(bool isDestroyed)
    {
        _shipTile.IsDestroyed = isDestroyed;
        return this;
    }

    public ShipTileBuilder WithPlayerShipId(Guid id)
    {
        _shipTile.PlayerShipId = id;
        return this;
    }

    public ShipTileBuilder WithPlayerShip(PlayerShip playerShip)
    {
        _shipTile.PlayerShip = playerShip;
        return this;
    }

    public ShipTileBuilder WithEngine(Engine engine)
    {
        _shipTile.Engine = engine;
        return this;
    }

    public ShipTileBuilder WithGuns(Gun gun)
    {
        _shipTile.Guns = gun;
        return this;
    }

    public ShipTileBuilder WithShield(bool shield)
    {
        _shipTile.Shield = shield;
        return this;
    }

    public ShipTileBuilder WithGunCount(int gunCount)
    {
        _shipTile.GunCount = gunCount;
        return this;
    }

    public ShipTileBuilder WithIsFlagship(bool isFlagship)
    {
        _shipTile.IsFlagship = isFlagship;
        return this;
    }

    public ShipTile Build()
    {
        return this._shipTile;
    }
}