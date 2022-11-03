using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Battleships.Data;
using Battleships.Data.Dto;
using Battleships.Data.Dto.InGameSession;
using Battleships.Models;
using Microsoft.EntityFrameworkCore;

namespace Battleships.Repositories
{
    public class GameSessionsRepository : BaseRepository<GameSession>, IGameSessionsRepository
    {
        public override async Task<GameSession> GetById(Guid id)
        {
            return await ItemSet
                .Include(gs => gs.Settings)
                .FirstOrDefaultAsync(gs => gs.Id == id);
        }

        public override async Task<List<GameSession>> GetAll()
        {
            return await ItemSet.Include(x => x.Players)
                .ThenInclude(x => x.User)
                .Include(x => x.Settings)
                .ToListAsync();
            
        }

        public async Task<GameSessionDto> GetDtoWithPlayers(Guid gameSessionId)
        {
            return await GetById(gameSessionId, gs => new GameSessionDto
            {
                Id = gs.Id,
                HostId = gs.Players[0].Id,
                HostName = gs.Players[0].User.Name,
                Icon = gs.Icon,
                Name = gs.Name,
                GridSize = gs.Settings.GridSize,
                GameType = gs.Settings.GameType,
                LobbyPlayers = gs.Players.Select(player => new PlayerLobbyDto
                {
                    Id = player.Id,
                    UserId = player.UserId,
                    Name = player.User.UserName
                }).ToList()
            });
        }

        public Task<int> GetRequiredDestroyedShipCount(Guid gameSessionId)
        {
            return GetById(gameSessionId, session => session.Settings.DestroyedShipCountForEndgame);
        }

        public Task<int> GetCurrentRound(Guid gameSessionId)
        {
            return GetById(gameSessionId, session => session.CurrentRound);
        }

        public Task<string> GetEndgameStrategy(Guid gameSessionId)
        {
            return GetById(gameSessionId, gs => gs.EndgameStrategy);
        }

        public async Task<(Guid, Guid)> GetPlayerIds(Guid gameSessionId, string currentUserId)
        {
            var ownPlayerId = await GetById(gameSessionId, gs => gs.Players.First(p => p.UserId == currentUserId).Id);
            var opponentPlayerId = await GetById(gameSessionId, gs => gs.Players.First(p => p.UserId != currentUserId).Id);

            return (ownPlayerId, opponentPlayerId);
        }

        public Task<InGameSessionDto> GetInGameSession(Guid gameSessionId, string currentUserId)
        {
            return GetById(gameSessionId, session => new InGameSessionDto
            {
                GameSessionId = gameSessionId,
                ColumnCount = session.Settings.ColumnCount,
                RowCount = session.Settings.RowCount,
                CurrentRound = session.CurrentRound,
                OpponentName = session.Players.First(p => p.UserId != currentUserId).User.UserName,
                OwnName = session.Players.First(p => p.UserId == currentUserId).User.UserName,
                CurrentRoundPlayerUserId = session.Players.First(p => p.IsCurrentPlayerTurn).UserId
            });
        }
        
        public async Task<GameSession> GetWithPlayersAndSettings(Guid gameSessionId)
        {
            return await ItemSet
                .Include(gs => gs.Settings)
                .Include(gs => gs.Players)
                .FirstOrDefaultAsync(gs => gs.Id == gameSessionId);
        }

        public GameSessionsRepository(ApplicationDbContext context) : base(context)
        {
        }
    }
}