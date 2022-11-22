export interface InGameSession {
    gameSessionId: string;
    columnCount: number;
    rowCount: number;

    currentRound: number;
    ownName: string;
    opponentName: string;
    currentRoundPlayerUserId: string;

    ownTiles: GameTile[];
    opponentTiles: GameTile[];
}

export interface GameTile {
    isShip: boolean;
    isDestroyed: boolean;
    columnCoordinate: number;
    rowCoordinate: number;
    shipId: string;
  SkinName: string;
  Label: string;
}
