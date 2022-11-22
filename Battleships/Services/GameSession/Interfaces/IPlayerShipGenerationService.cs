using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Battleships.Models;

namespace Battleships.Services.GameSession.Interfaces;

public interface IPlayerShipGenerationService
{
    Task<List<PlayerShip>> GeneratePlayerShips(GameSessionSettings settings);
}