import { InGameSession } from "../models/in-game-session";
import { AbstractInput } from "./abstract-input";

export class SInput extends AbstractInput{
  Interpret(yCoord: number, xCoord: number, gameSession: InGameSession): void {
    gameSession.opponentTiles.forEach(t => t.isSelected = false);
    var tile = gameSession.opponentTiles.filter(t => t.columnCoordinate == xCoord && t.rowCoordinate == yCoord);
    if (tile[0] != null) {
      tile[0].isSelected = true;
    }
  }

}
