using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.SignalR.Models;

namespace Battleships.Services.EventConsumers;

public class EventsMediator : IEventsMediator
{
    private readonly IConsumer<AddFriendEvent> _addFriendConsumer;
    private readonly IConsumer<RemoveFriendEvent> _removeFriendConsumer;
    private readonly IConsumer<AttackEvent> _attackEventConsumer;

    public EventsMediator(
        IConsumer<AddFriendEvent> addFriendConsumer,
        IConsumer<RemoveFriendEvent> removeFriendConsumer,
        IConsumer<AttackEvent> attackEventConsumer
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
