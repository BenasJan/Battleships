using System;
using System.Threading.Tasks;

namespace Battleships.Facades;

public interface IGameSessionFacade
{
    public Task<Guid> CreateGameSession();
}