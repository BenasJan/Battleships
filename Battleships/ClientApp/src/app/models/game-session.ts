import {GameType} from "./enums/game-type";

export interface GameSession {
  id: string;
  icon: string;
  name: string;
  gridSize: string;
  gameType: string;
  hostName: string;
  hostId: string;
}
