using Battleships.Visitor;
using System.Threading.Tasks;

namespace Battleships.Services.EventConsumers;

public interface IEventsMediator
{
    Task PublishEvent(AcceptableEvent @event);
}