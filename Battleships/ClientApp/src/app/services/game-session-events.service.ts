import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { AttackPayload } from '../models/payloads/attack-payload';

@Injectable({
  providedIn: 'root'
})
export class GameSessionEventsService {

  private readonly attacksSubject = new Subject<AttackPayload>();
  public readonly enemyAttacks$ = this.attacksSubject.asObservable();

  constructor() { }

  public publishAttackEvent(attack: AttackPayload){
    this.attacksSubject.next(attack);
  }
}
