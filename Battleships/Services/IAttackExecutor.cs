using System.Threading.Tasks;
using Battleships.SignalR.Models;

namespace Battleships.Services
{
    public interface IAttackExecutor
    {
        Task ExecuteAttack(AttackEvent attack);
    }
}