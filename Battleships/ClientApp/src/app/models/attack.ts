export interface Attack {
    gameSessionId: string;
    initiatorUserId: string;
    targetXCoordinate: number;
    targetYCoordinate: number;
    missed: boolean;
}
