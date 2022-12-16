import { Injectable } from '@angular/core';
import { EndgameReachedPayload } from '../models/payloads/endgame-reached-payload';
import { AttackMovesObserver } from '../observer/attack-moves-observer';
import { AttackMovesSubject } from '../observer/attack-moves-subject';
import { EndgameReachedObserver } from '../observer/endgame-reached-observer';
import { EndgameReachedSubject } from '../observer/endgame-reached-subject';

@Injectable({
  providedIn: 'root'
})
export class GameSessionEventsService {

  private opponentAttacksSubject = new AttackMovesSubject();
  private ownAttacksSubject = new AttackMovesSubject();

  private endgameReachedSubject = new EndgameReachedSubject();

  //#region opponent attacks
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
  //#endregion

  //#region own attacks
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
  //#endregion

  //#region endgame
  public publishEndgameReached(endgame: EndgameReachedPayload): void {
    this.endgameReachedSubject.sendSession(endgame);
  }

  public onEndgameReached(callback: (endgame: EndgameReachedPayload) => void): EndgameReachedObserver {
    const observer = new EndgameReachedObserver(callback);
    this.endgameReachedSubject.attach(observer);

    return observer;
  }

  public discardEndgameReachedObserver(observer: EndgameReachedObserver): void {
    this.endgameReachedSubject.detach(observer);
  }
  //#endregion
}
