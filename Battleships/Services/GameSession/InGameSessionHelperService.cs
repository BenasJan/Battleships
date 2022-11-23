using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data.Dto.InGameSession;
using Battleships.Decorators;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;

namespace Battleships.Services.GameSession;

public class InGameSessionHelperService : IInGameSessionHelperService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly ICurrentUserService _currentUserService;

    public InGameSessionHelperService(
        IBattleshipsDatabase battleshipsDatabase,
        ICurrentUserService userService
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _currentUserService = userService;
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
}