import { AttackMovesSubject } from "./attack-moves-subject";
import { Observer } from "./observer";

export class AttackMovesObserver implements Observer<AttackMovesSubject> {
    
    private attackCallback: (xCoord: number, yCoord: number) => void;

    constructor(attackCallback: (xCoord: number, yCoord: number) => void) {
        this.attackCallback = attackCallback;
    }
    
    update(subject: AttackMovesSubject): void {
        this.attackCallback(subject.xCoord, subject.yCoord);
    }


}