using System;
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
        private readonly IInGameSessionHelperService _inGameSessionHelperService;

        public GameSessionService(
            IBattleshipsDatabase battleshipsDatabase,
            ICurrentUserService userService,
            IInGameSessionHelperService inGameSessionHelperService
        )
        {
            _battleshipsDatabase = battleshipsDatabase;
            _currentUserService = userService;
            _inGameSessionHelperService = inGameSessionHelperService;
        }

        public async Task<Guid> CreateSession(GameSessionRequestDto dto)
        {
            var facade = new GameSessionFacade(_battleshipsDatabase, _currentUserService, dto);
            var guid = await facade.CreateGameSession();
            return guid;
            // return await new GameSessionFacade(_battleshipsDatabase, _currentUserService, dto).CreateGameSession();
        }

        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _battleshipsDatabase.GameSessionsRepository.GetAll();
            if (models is null)
                return new List<GameSessionDto>();
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
            var tiles = Enumerable.Range(1, columnCount).SelectMany(columnCoordinate =>
            {
                return Enumerable.Range(1, rowCount).Select(rowCoordinate =>
                {
                    var shipTile = shipTiles.FirstOrDefault(st =>
                        st.XCoordinate == columnCoordinate && st.YCoordinate == rowCoordinate
                    );

                    IShipAppearance shipAppearance = new ShipAppearance();
                    IShipAppearance skinDecorator = new SkinDecorator(shipAppearance).Draw();
                    IShipAppearance labelDecorator = new LabelDecorator(skinDecorator).Draw();

                    var tile = new GameTile
                    {
                        ColumnCoordinate = columnCoordinate,
                        RowCoordinate = rowCoordinate,
                        IsShip = shipTile is not null,
                        IsDestroyed = shipTile is not null
                            ? shipTile.IsDestroyed
                            : false,
                        ShipId = shipTile != null ? shipTile.PlayerShipId : null,
                        SkinName = shipTile != null ? labelDecorator.SkinName : "",
                        Label = shipTile != null ? labelDecorator.Label : ""
                    };

                    return tile;
                });
            });

            return tiles.ToList();

        }

        public async Task<InGameSessionDto> MoveShipInSession (Guid gameSessionId, Guid shipId, string direction)
        {

            PlayerShip playerShip = await _battleshipsDatabase.PlayerShipsRepository.GetById(shipId);

            var playerTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(playerShip.PlayerId);

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

            var gameSessionDto = await _inGameSessionHelperService.GetInGameSession(gameSessionId);
            var updatedPosTiles = _inGameSessionHelperService.GetTileDtos(playerTiles, gameSessionDto.ColumnCount, gameSessionDto.RowCount);
            gameSessionDto.OwnTiles = updatedPosTiles;

            return gameSessionDto;
        }
    }
}