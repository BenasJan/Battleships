using System.Threading.Tasks;

namespace Battleships.Services;

public interface IEndgameService
{
    Task FinishSessionOnEndgame();
}