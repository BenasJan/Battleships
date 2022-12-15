using System.Threading.Tasks;
using Battleships.Data.Dto;
using Battleships.SignalR.Models;
using Battleships.Visitor;

namespace Battleships.Services.EventConsumers;

public class EventsMediator : IEventsMediator, IVisitor
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

    public async Task PublishEvent(AcceptableEvent @event)
    {

        await @event.Accept(this);
    }

    public Task Visit(AddFriendEvent addFriendEvent) => _addFriendConsumer.ConsumeEvent(addFriendEvent);

    public Task Visit(RemoveFriendEvent removeFriendEvent) => _removeFriendConsumer.ConsumeEvent(removeFriendEvent);

    public Task Visit(AttackEvent attackEvent) => _attackEventConsumer.ConsumeEvent(attackEvent);

}
