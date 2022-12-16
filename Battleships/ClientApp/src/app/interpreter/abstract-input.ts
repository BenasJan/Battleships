import { GameSessionComponent } from "../components/game-session/game-session.component";
import { GameTile, InGameSession } from "../models/in-game-session";

export abstract class AbstractInput{
  protected context: GameSessionComponent;
  protected session: InGameSession;

  constructor(context: GameSessionComponent, session: InGameSession) {
    this.context = context;
    this.session = session;
  }

  public abstract Interpret(yCoord: number, xCoord: number, session: InGameSession): void;
}
