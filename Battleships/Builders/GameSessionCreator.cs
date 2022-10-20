using System;

namespace Battleships.Builders;

public class GameSessionCreator
{
    private readonly IGameSessionBuilder _builder;
    
    public GameSessionCreator(IGameSessionBuilder builder)
    {
        this._builder = builder;
    }

    public void BuildDefaultMinimalSession()
    {
        this._builder.WithIcon("");
        this._builder.WithName("Name");
        this._builder.WithDateCreated(DateTime.Now);
    }
    
}