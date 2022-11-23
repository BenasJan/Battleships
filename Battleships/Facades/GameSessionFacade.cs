using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Builders;
using Battleships.Data.Dto;
using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.Services.Authentication.Interfaces;

namespace Battleships.Facades;

public class GameSessionFacade : IGameSessionFacade
{
    private readonly IBattleshipsDatabase _database;
    private readonly ICurrentUserService _currentUserService;
    private readonly GameSessionRequestDto dto;

    public GameSessionFacade(IBattleshipsDatabase database, ICurrentUserService currentUserService, GameSessionRequestDto dto)
    {
        this._database = database;
        this._currentUserService = currentUserService;
        this.dto = dto;
    }

    public async Task<Guid> CreateGameSession()
    {
        var userId = _currentUserService.GetCurrentUserId();
            
        var gameSettings = new GameSessionSettings
        {
            ColumnCount = dto.SettingsDto.ColumnCount,
            RowCount = dto.SettingsDto.RowCount,
            GameType = dto.SettingsDto.GameType
        };
        var players = new List<Player>
        {
            new Player
            {
                IsHost = true,
                UserId = userId,
                IsCurrentPlayerTurn = true
            }
        };

        var gameSession = new GameSessionBuilder()
            .WithIcon(dto.Icon)
            .WithName(dto.Name)
            .WithDateCreated(DateTime.UtcNow)
            .WithSessionSettings(gameSettings)
            .WithPlayers(players)
            .WithStatus(GameSessionStatus.Created)
            .Build();
            
        var id = await _database.GameSessionsRepository.Create(gameSession);
            
        return id;
    }
}