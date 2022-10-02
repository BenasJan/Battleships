import { Injectable } from '@angular/core';
import { HubConnection, HubConnectionBuilder, LogLevel } from '@microsoft/signalr';
import { from, tap } from 'rxjs';
import { AttackPayload } from '../models/payloads/attack-payload';
import { GameSessionEventsService } from './game-session-events.service';

@Injectable({
  providedIn: 'root'
})
export class SignalRService {
  private readonly connection: HubConnection;

  constructor(
    private readonly gameSessionEventsService: GameSessionEventsService
  )
  {
    this.connection = this.getConnection();
    this.configureMethods();
  }

  //#region initialization
  private getConnection(): HubConnection {
    return new HubConnectionBuilder()
      .withUrl('/battleshipsHub')
      .configureLogging(LogLevel.Information)
      .build();
  }

  private configureMethods() {
    this.connection.on("underAttack", (payload: AttackPayload) => {
      this.gameSessionEventsService.publishAttackEvent(payload);
    })
  }
  //#endregion

  public initializeConnection(): void {
    this.connection.onclose(() => this.connectToHub());

    this.connectToHub();
  }

  private connectToHub(): void {
    from(this.connection.start()).pipe(
      tap(() => console.log('SignalR connected'))
    ).subscribe();
  }
}
