using System;
using System.Threading.Tasks;
using Battleships.Models;
using Battleships.Models.enums;
using Battleships.Repositories;
using Battleships.SignalR.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace Battleships.Services;

public class EndgameService : IEndgameService
{
    private readonly IBattleshipsDatabase _battleshipsDatabase;
    private readonly IEndgameStrategyService _endgameStrategyService;
    private readonly IBattleshipsSynchronizationService _battleshipsSynchronizationService;
    private readonly UserManager<ApplicationUser> _userManager;

    public EndgameService(
        IBattleshipsDatabase battleshipsDatabase,
        IEndgameStrategyService endgameStrategyService,
        IBattleshipsSynchronizationService battleshipsSynchronizationService,
        UserManager<ApplicationUser> userManager
    )
    {
        _battleshipsDatabase = battleshipsDatabase;
        _endgameStrategyService = endgameStrategyService;
        _battleshipsSynchronizationService = battleshipsSynchronizationService;
        _userManager = userManager;
    }

    public async Task<bool> IsEndgameReached(Guid gameSessionId)
    {
        var strategy = await _endgameStrategyService.GetEndgameStrategy(gameSessionId);

        return await strategy.IsEndgameReached(gameSessionId);
    }

    public async Task EndGameSession(Guid gameSessionId, string attackerId)
    {
        var session = await _battleshipsDatabase.GameSessionsRepository.GetById(gameSessionId);
        
        session.WinnerId = attackerId;
        session.Status = GameSessionStatus.EndgameReached;

        await _battleshipsDatabase.GameSessionsRepository.Update(session);

        var winnerName = (await _userManager.FindByIdAsync(attackerId)).UserName;
        await _battleshipsSynchronizationService.SendEndgameReached(gameSessionId, winnerName);
    }
}