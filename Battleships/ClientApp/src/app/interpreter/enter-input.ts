import { GameTile, InGameSession } from "../models/in-game-session";
import { AbstractInput } from "./abstract-input";

export class EnterInput extends AbstractInput{
  Interpret(yCoord: number, xCoord: number, gameSession: InGameSession): void {
    this.context.submitAttack();
  }
}
