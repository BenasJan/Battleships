import { Injectable } from '@angular/core';
import { AttackMovesObserver } from '../observer/attack-moves-observer';
import { AttackMovesSubject } from '../observer/attack-moves-subject';

@Injectable({
  providedIn: 'root'
})
export class GameSessionEventsService {

  private opponentAttacksSubject = new AttackMovesSubject();
  private ownAttacksSubject = new AttackMovesSubject();

  constructor() { }

  public publishOpponentAttack(xCoord: number, yCoord: number): void {
    this.opponentAttacksSubject.sendAttackMove(xCoord, yCoord);
  }

  public onOpponentMoveSubmitted(callback: (xCoord: number, yCoord: number) => void): AttackMovesObserver {
    const observer = new AttackMovesObserver(callback);
    this.opponentAttacksSubject.attach(observer);

    return observer;
  }

  public discardOpponentMovesObserver(observer: AttackMovesObserver): void {
    this.opponentAttacksSubject.detach(observer);
  }

  public publishOwnAttack(xCoord: number, yCoord: number): void {
    this.ownAttacksSubject.sendAttackMove(xCoord, yCoord);
  }

  public onOwnMoveSubmitted(callback: (xCoord: number, yCoord: number) => void): AttackMovesObserver {
    const observer = new AttackMovesObserver(callback);
    this.ownAttacksSubject.attach(observer);

    return observer;
  }

  public discardOwnMovesObserver(observer: AttackMovesObserver): void {
    this.ownAttacksSubject.detach(observer);
  }
}
