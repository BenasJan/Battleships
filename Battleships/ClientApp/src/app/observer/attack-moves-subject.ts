import { AttackMovesObserver } from "./attack-moves-observer";
import { Subject } from "./subject";

export class AttackMovesSubject implements Subject {
    private observers: AttackMovesObserver[] = [];

    public xCoord: number;
    public yCoord: number;

    attach(observer: AttackMovesObserver): void {
        const isExist = this.observers.includes(observer);
        if (isExist) {
            return console.log('Subject: Observer has been attached already.');
        }

        this.observers.push(observer);
    }

    detach(observer: AttackMovesObserver): void {
        const observerIndex = this.observers.indexOf(observer);
        if (observerIndex === -1) {
            return console.log('Subject: Nonexistent observer.');
        }

        this.observers.splice(observerIndex, 1);
    }

    notify(): void {
        for (const observer of this.observers) {
            observer.update(this);
        }
    }

    public sendAttackMove(xCoord: number, yCoord: number): void {
        this.xCoord = xCoord;
        this.yCoord = yCoord
        this.notify()
    }
}