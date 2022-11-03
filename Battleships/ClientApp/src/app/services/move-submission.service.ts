import { Injectable } from '@angular/core';
import { AttackMovesObserver } from '../observer/attack-moves-observer';
import { AttackMovesSubject } from '../observer/attack-moves-subject';

@Injectable({
  providedIn: 'root'
})
export class MoveSubmissionEventsService {

  private attacksSubject = new AttackMovesSubject();

  constructor() { }

  public submitAttack(xCoord: number, yCoord: number): void {
    this.attacksSubject.sendAttackMove(xCoord, yCoord);
  }

  public onMoveSubmitted(attackCallback: (xCoord: number, yCoord: number) => void): AttackMovesObserver {
    const observer = new AttackMovesObserver(attackCallback);

    this.attacksSubject.attach(observer);
    return observer;
  }

  public discardOnMovesSubmitted(observer: AttackMovesObserver): void {
    this.attacksSubject.detach(observer);
  }
}
