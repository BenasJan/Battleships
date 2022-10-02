﻿using System;
using System.Threading.Tasks;
using Battleships.SignalR.Interfaces;
using Battleships.SignalR.Models;
using Microsoft.AspNetCore.SignalR;

namespace Battleships.SignalR
{
    public class BattleshipsSynchronizationService : IBattleshipsSynchronizationService
    {
        private readonly IHubContext<BattleshipsHub> _battleshipsHub;

        public BattleshipsSynchronizationService(IHubContext<BattleshipsHub> battleshipsHub)
        {
            _battleshipsHub = battleshipsHub;
        }

        public async Task SendAttackMessage(Guid gameSessionId, BattleshipsMessage<AttackPayload> message)
        {
            await _battleshipsHub.Clients.Group(gameSessionId.ToString()).SendAsync("underAttack", message);
        }
    }
}