using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Data.Dto.InGameSession;
using Battleships.Models;

namespace Battleships.Services.GameSession.Interfaces
{
    public interface IInGameSessionHelperService
    {
        public Task<InGameSessionDto> GetInGameSession(Guid gameSessionId);
        public List<GameTile> GetTileDtos(List<ShipTile> shipTiles, int columnCount, int rowCount);
    }
}