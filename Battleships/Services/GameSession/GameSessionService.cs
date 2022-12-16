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

        public async Task<Guid> CreateSession(GameSessionRequestDto gameSessionDto)
        {
            var facade = new GameSessionFacade(_battleshipsDatabase, _currentUserService, gameSessionDto);
            var guid = await facade.CreateGameSession();
            return guid;
        }

        public async Task<List<GameSessionDto>> ListAllSessions()
        {
            var models = await _battleshipsDatabase.GameSessionsRepository.GetAll();
            if (models is null)
                return new List<GameSessionDto>();
            return models.Select(x => x.ToDto()).ToList();
        }
        
        public async Task<GameSessionDto> GetSession(Guid id)
        {
            return await _battleshipsDatabase.GameSessionsRepository.GetDtoWithPlayers(id);
        }
        
        public List<GameTile> GetTileDtos(List<ShipTile> tiles, int columnCount, int rowCount)
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
                    
                    var tile = new GameTile
                    {
                        ColumnCoordinate = columnCoordinate,
                        RowCoordinate = rowCoordinate,
                        IsShip = shipTile?.PlayerShipId is not null,
                        IsDestroyed = (shipTile?.IsDestroyed ?? false) || (emptyTile?.IsDestroyed ?? false),
                        ShipId = shipTile != null ? shipTile.PlayerShipId : null,
                    };

                    return tile;
                });
            });

            return dtos.ToList();
        }



        public async Task<InGameSessionDto> MoveShipInSession (Guid gameSessionId, Guid shipId, string direction)
        {

            var playerShip = await _battleshipsDatabase.PlayerShipsRepository.GetById(shipId);
            var playerTiles = await _battleshipsDatabase.ShipTilesRepository.GetPlayerTiles(playerShip.PlayerId);

            switch (direction)
            {
                case "Up":
                    IShipActionCommand shipMoveUpCommand = new ShipMoveUpCommand(playerShip);
                    shipMoveUpCommand.Execute();
                    break;
                case "Down":
                    IShipActionCommand shipMoveDownCommand = new ShipMoveDownCommand(playerShip);
                    shipMoveDownCommand.Execute();
                    break;                
                case "Left":
                    IShipActionCommand shipMoveLeftCommand = new ShipMoveLeftCommand(playerShip);
                    shipMoveLeftCommand.Execute();
                    break;                
                case "Right":
                    IShipActionCommand shipMoveRightCommand = new ShipMoveRightCommand(playerShip);
                    shipMoveRightCommand.Execute();
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