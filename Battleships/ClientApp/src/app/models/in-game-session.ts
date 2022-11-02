export interface InGameSession {
    gameSessionId: string;
    columnCount: number;
    rowCount: number;

    currentRound: number;

    ownTiles: GameTile[];
    opponentTiles: GameTile[];
}

export interface GameTile {
    isShip: boolean;
    isDestroyed: boolean;
    columnCoordinate: number;
    rowCoordinate: number;
}