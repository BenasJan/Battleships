﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using Battleships.Commands;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Decorators;
using Battleships.Facades;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.GameSession.Interfaces;

namespace Battleships.Services.GameSession
{
    public class GameSessionService : IGameSessionService
    {
        private readonly IBattleshipsDatabase _battleshipsDatabase;
        private readonly ICurrentUserService _currentUserService;

        public GameSessionService(
            IBattleshipsDatabase battleshipsDatabase,
            ICurrentUserService userService
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = userService;
        }

        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            return await new GameSessionFacade(_battleshipsDatabase, _currentUserService, dto).CreateGameSession();
        }

        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _battleshipsDatabase.GameSessionsRepository.GetAll();
            return models.Select(x => x.toDto()).ToList();
        }
        
        public async Task<GameSessionDto> GetSession(Guid id)
        {
            return await _battleshipsDatabase.GameSessionsRepository.GetDtoWithPlayers(id);
        }

        public async Task<InGameSessionDto> GetInGameSession(Guid gameSessionId)
        {
            var currentUserId = _currentUserService.GetCurrentUserId();
            
            var (ownPlayerId, opponentPlayerId) = await _battleshipsDatabase.GameSessionsRepository.GetPlayerIds(gameSessionId, currentUserId);
            var ownTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(ownPlayerId);
            var opponentTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(opponentPlayerId);
            
            var dto = await _battleshipsDatabase.GameSessionsRepository.GetInGameSession(gameSessionId, currentUserId);
            dto.OwnTiles = GetTileDtos(ownTiles, dto.ColumnCount, dto.RowCount);
            dto.OpponentTiles = GetTileDtos(opponentTiles, dto.ColumnCount, dto.RowCount);
            
            return dto;
        }



        public List<GameTile> GetTileDtos(List<ShipTile> shipTiles, int columnCount, int rowCount)
        {
            var shipTiles = tiles.Where(t => t.PlayerShipId is not null).ToList();
            var emptyTiles = tiles.Where(t => t.PlayerShipId is null).ToList();
            
            var dtos = Enumerable.Range(0, columnCount).SelectMany(columnCoordinate =>
            {
                return Enumerable.Range(0, rowCount).Select(rowCoordinate =>
                {
                    var shipTile = shipTiles.FirstOrDefault(st =>
                        st.XCoordinate == columnCoordinate && st.YCoordinate == rowCoordinate
                    );
                    
                    var emptyTile = emptyTiles.FirstOrDefault(st =>
                        st.XCoordinate == columnCoordinate && st.YCoordinate == rowCoordinate
                    );

                    IShipAppearance shipAppearance = new ShipAppearance();
                    IShipAppearance skinDecorator = new SkinDecorator(shipAppearance).Draw();
                    IShipAppearance labelDecorator = new LabelDecorator(skinDecorator).Draw();

                    var tile = new GameTile
                    {
                        ColumnCoordinate = columnCoordinate,
                        RowCoordinate = rowCoordinate,
                        IsShip = shipTile?.PlayerShipId is not null,
                        IsDestroyed = (shipTile?.IsDestroyed ?? false) || (emptyTile?.IsDestroyed ?? false),
                        ShipId = shipTile != null ? shipTile.PlayerShipId : null,
                        SkinName = shipTile != null ? labelDecorator.SkinName : "",
                        Label = shipTile != null ? labelDecorator.Label : ""
                    };

                    return tile;
                });
            });

            return dtos.ToList();
        }

        public async Task<InGameSessionDto> MoveShipInSession (Guid gameSessionId, Guid shipId, string direction)
        {

            PlayerShip playerShip = await _battleshipsDatabase.PlayerShipsRepository.GetById(shipId);

            var playerTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(playerShip.PlayerId);

            //if (direction == "Up")
            //{
            //    IShipActionCommand shipMoveUpCommand = new ShipMoveUpCommand(playerShip);
            //    shipMoveUpCommand.Execute();
            //}

            switch (direction)
            {
                case "Up":
                    IShipActionCommand shipMoveUpCommand = new ShipMoveUpCommand(playerShip);
                    shipMoveUpCommand.Execute();
                    break;
                case "Down":
                    IShipActionCommand ShipMoveDownCommand = new ShipMoveDownCommand(playerShip);
                    ShipMoveDownCommand.Execute();
                    break;                
                case "Left":
                    IShipActionCommand ShipMoveLeftCommand = new ShipMoveLeftCommand(playerShip);
                    ShipMoveLeftCommand.Execute();
                    break;                
                case "Right":
                    IShipActionCommand ShipMoveRightCommand = new ShipMoveRightCommand(playerShip);
                    ShipMoveRightCommand.Execute();
                    break;
            }

            await _battleshipsDatabase.ShipTilesRepository.UpdateMany(playerShip.Tiles);

            var gameSessionDto = await this.GetInGameSession(gameSessionId);
            var updatedPosTiles = GetTileDtos(playerTiles, gameSessionDto.ColumnCount, gameSessionDto.RowCount);
            gameSessionDto.OwnTiles = updatedPosTiles;

            return gameSessionDto;
        }
    }
}