import { EndgameReachedPayload } from "../models/payloads/endgame-reached-payload";
import { EndgameReachedSubject } from "./endgame-reached-subject";
import { Observer } from "./observer";

export class EndgameReachedObserver implements Observer<EndgameReachedSubject> {
    private callback: (endgame: EndgameReachedPayload) => void;

    constructor(callback: (endgame: EndgameReachedPayload) => void) {
        this.callback = callback;
    }
    
    update(subject: EndgameReachedSubject): void {
        this.callback(subject.endgame);
    }
}