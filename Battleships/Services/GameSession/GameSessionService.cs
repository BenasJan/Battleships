﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
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

        private List<GameTile> GetTileDtos(List<ShipTile> tiles, int columnCount, int rowCount)
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
                        IsDestroyed = (shipTile?.IsDestroyed ?? false) || (emptyTile?.IsDestroyed ?? false)
                    };

                    return tile;
                });
            });

            return dtos.ToList();
        }
    }
}