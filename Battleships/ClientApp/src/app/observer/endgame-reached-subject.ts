import { EndgameReachedObserver } from "./endgame-reached-observer";
import { Observer } from "./observer";
import { Subject } from "./subject";

export class EndgameReachedSubject implements Subject {
    public gameSessionId: string;
    private observers: EndgameReachedObserver[] = [];

    attach(observer: EndgameReachedObserver): void {
        const isExist = this.observers.includes(observer);
        if (isExist) {
            return console.log('Subject: Observer has been attached already.');
        }

        this.observers.push(observer);
    }
    detach(observer: EndgameReachedObserver): void {
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

    public sendSessionId(id: string) {
        this.gameSessionId = id;
        this.notify();
    }
}