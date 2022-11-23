using System;
using Battleships.Models;
using Battleships.Models.enums;

namespace Battleships.Services.Builders
{
    public class ShipTileBuilder : IShipTileBuilder
    {
        private ShipTile shipTile = new ShipTile();
    
        public ShipTileBuilder WithXCoordinate(int x)
        {
            shipTile.XCoordinate = x;
            return this;
        }

        public ShipTileBuilder WithYCoordinate(int y)
        {
            shipTile.YCoordinate = y;
            return this;
        }

        public ShipTileBuilder WithIsDestroyed(bool isDestroyed)
        {
            shipTile.IsDestroyed = isDestroyed;
            return this;
        }

        public ShipTileBuilder WithPlayerShipId(Guid id)
        {
            shipTile.PlayerShipId = id;
            return this;
        }

        public ShipTileBuilder WithPlayerShip(PlayerShip playerShip)
        {
            shipTile.PlayerShip = playerShip;
            return this;
        }

        public ShipTileBuilder WithEngine(Engine engine)
        {
            shipTile.Engine = engine;
            return this;
        }

        public ShipTileBuilder WithGuns(Gun gun)
        {
            shipTile.Guns = gun;
            return this;
        }

        public ShipTileBuilder WithShield(bool shield)
        {
            shipTile.Shield = shield;
            return this;
        }

        public ShipTileBuilder WithGunCount(int gunCount)
        {
            shipTile.GunCount = gunCount;
            return this;
        }

        public ShipTileBuilder WithIsFlagship(bool isFlagship)
        {
            shipTile.IsFlagship = isFlagship;
            return this;
        }

        public ShipTile Build()
        {
            return this.shipTile;
        }
    }
}