using System;

namespace Battleships.Services.Builders
{
    public class GameSessionCreator
    {
        private readonly IGameSessionBuilder _builder;
    
        public GameSessionCreator(IGameSessionBuilder builder)
        {
            _builder = builder;
        }

        public void BuildDefaultMinimalSession()
        {
            _builder.WithIcon("");
            _builder.WithName("Name");
            _builder.WithDateCreated(DateTime.Now);
        }
    }
}