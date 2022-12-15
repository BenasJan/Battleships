using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services
{
    public interface IAttackExecutionService
    {
        Task ExecuteAttack(AttackEvent attack);
    }
}