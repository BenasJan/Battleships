import {LobbyPlayer} from "./lobby-player";

export interface LobySession {
  id: string;
  icon: string;
  name: string;
  gridSize: string;
  gameType: string;
  hostName: string;
  hostId: string;
  lobbyPlayers: LobbyPlayer[];
}
