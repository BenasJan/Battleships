import { GameSessionComponent } from "../components/game-session/game-session.component";

export abstract class AbstractInput{
  protected context: GameSessionComponent;

  constructor(context: GameSessionComponent) {
    this.context = context;
  }

  public abstract Interpret(event: KeyboardEvent): void;
}
