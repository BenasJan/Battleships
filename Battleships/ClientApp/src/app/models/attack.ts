export interface Attack {
    gameSessionId: string;
    attackingUserId: string;
    targetXCoordinate: number;
    targetYCoordinate: number;
    missed: boolean;
}
