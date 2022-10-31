import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HubConnection, HubConnectionBuilder, HubConnectionState, LogLevel } from '@microsoft/signalr';
import { from, Observable, tap } from 'rxjs';
import { AttackPayload } from '../models/payloads/attack-payload';
import { AuthorizationService } from './authorization.service';
import { GameSessionEventsService } from './game-session-events.service';

@Injectable({
  providedIn: 'root'
})
export class SignalRService {
  private readonly connection: HubConnection;

  constructor(
    private readonly gameSessionEventsService: GameSessionEventsService,
    private readonly router: Router,
    private readonly authorizationService: AuthorizationService
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
      .withAutomaticReconnect()
      .build();
  }

  private configureMethods() {
    this.connection.on("underAttack", (payload: AttackPayload) => {
      this.gameSessionEventsService.publishAttackEvent(payload);
    })

    this.connection.on("gameLaunched", (payload: { gameSessionId: string }) => {
      this.router.navigateByUrl(`/gameplay/${payload.gameSessionId}`)
    })

    this.connection.on("invited", (payload: { gameSessionId: string }) => {
      this.connectToGameSession(payload.gameSessionId);
    })
  }
  //#endregion

  public connect(): void {
    const userId = this.authorizationService.getUserId();
    
    this.connectToHub().subscribe(_ => this.connection.invoke("ConnectUser", userId))
  }

  public connectToGameSession(gameSessionId: string): void {
    if (this.connection.state == HubConnectionState.Disconnected) {
      this.connectToHub().subscribe(
        _ => this.connection.invoke("ConnectToGameSession", gameSessionId)
      )
    } else {
      this.connection.invoke("ConnectToGameSession", gameSessionId);
    }
  }

  public removeGameSessionConnection(gameSessionId: string): void {
    this.connection.invoke("DisconnectFromGameSession", gameSessionId);
  }

  private connectToHub(): Observable<void> {
      return from(this.connection.start()).pipe(
        tap(() => console.log('SignalR connected'))
      );
  }
}
