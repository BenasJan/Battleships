import {GameSessionComponent} from "../components/game-session/game-session.component";

export abstract class GameStyleState {
  protected context: GameSessionComponent;

 constructor(context: GameSessionComponent) {
    this.context = context;
  }

  public abstract changeState(): GameStyleState;
}
