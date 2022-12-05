using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.SignalR.Models;

namespace Battleships.Services.EventConsumers;

public class EventsMediator : IEventsMediator
{
    private readonly BaseConsumer<AddFriendEvent> _addFriendConsumer;
    private readonly BaseConsumer<RemoveFriendEvent> _removeFriendConsumer;
    private readonly BaseConsumer<AttackEvent> _attackEventConsumer;

    public EventsMediator(
        BaseConsumer<AddFriendEvent> addFriendConsumer,
        BaseConsumer<RemoveFriendEvent> removeFriendConsumer,
        BaseConsumer<AttackEvent> attackEventConsumer
    )
    {
        _addFriendConsumer = addFriendConsumer;
        _removeFriendConsumer = removeFriendConsumer;
        _attackEventConsumer = attackEventConsumer;
    }

    public async Task PublishEvent<TEvent>(TEvent @event) where TEvent : IEvent
    {
        switch (@event)
        {
            case AddFriendEvent addFriendEvent:
                await _addFriendConsumer.ConsumeEvent(addFriendEvent);
                break;
            case RemoveFriendEvent removeFriendEvent:
                await _removeFriendConsumer.ConsumeEvent(removeFriendEvent);
                break;
            case AttackEvent attackEvent:
                await _attackEventConsumer.ConsumeEvent(attackEvent);
                break;
        }
    }
}
