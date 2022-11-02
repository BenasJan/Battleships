import { Injectable } from '@angular/core';
import { Attack } from '../models/attack';
import { SignalRService } from './signal-r.service';

@Injectable({
  providedIn: 'root'
})
export class AttackPublishingService {

  constructor(
    private signalRService: SignalRService
  ) {

  }
  public publishAttack(attack: Attack): void {
    this.signalRService.callMethod('PublishAttack', attack)
  }
}
