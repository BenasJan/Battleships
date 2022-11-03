import { Observer } from "./observer";

export interface Subject {
    attach(observer: Observer<Subject>): void;
    detach(observer: Observer<Subject>): void;
    notify(): void;
}