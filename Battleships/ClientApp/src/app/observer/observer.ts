import { Subject } from "./subject";

export interface Observer<TSubject extends Subject> {
    update(subject: TSubject): void;
}