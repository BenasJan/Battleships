import { EndgameReachedSubject } from "./endgame-reached-subject";
import { Observer } from "./observer";

export class EndgameReachedObserver implements Observer<EndgameReachedSubject> {
    private callback: (gameSessionId: string) => void;

    constructor(callback: (gameSessionId: string) => void) {
        this.callback = callback;
    }
    
    update(subject: EndgameReachedSubject): void {
        this.callback(subject.gameSessionId);
    }

}