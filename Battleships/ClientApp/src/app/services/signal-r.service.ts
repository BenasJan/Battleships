import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HubConnection, HubConnectionState } from '@microsoft/signalr';
import { from, Observable, tap } from 'rxjs';
import { Attack } from '../models/attack';
import { AuthorizationService } from './authorization.service';
import { GameSessionEventsService } from './game-session-events.service';
import { SignalRConnection } from './signal-r-connection';

@Injectable({
  providedIn: 'root'
})
export class SignalRService {
  private readonly connection: HubConnection;

  private gameSessionId: string;

  constructor(
    private readonly gameSessionEventsService: GameSessionEventsService,
    private readonly router: Router,
    private readonly authorizationService: AuthorizationService
  )
  {
    this.connection = SignalRConnection.getInstance();
    this.configureMethods();
  }

  private configureMethods() {
    this.connection.on("underAttack", (payload) => {
      const isFromOpponent = payload.callerUserId !== this.authorizationService.getUserId();
      const attack: Attack = payload.payload;

      if (isFromOpponent) {
        this.gameSessionEventsService.publishOpponentAttack(attack.targetXCoordinate, attack.targetYCoordinate);
      } else {
        this.gameSessionEventsService.publishOwnAttack(attack.targetXCoordinate, attack.targetYCoordinate);
      }
    })

    this.connection.on("gameLaunched", (payload: { gameSessionId: string }) => {
      this.router.navigateByUrl(`/gameplay/${payload.gameSessionId}`)
    })

    this.connection.on("invited", (payload: { gameSessionId: string }) => {
      this.connectToGameSession(payload.gameSessionId);
    })

    this.connection.on("endgameReached", (payload) => {
      this.gameSessionEventsService.publishEndgameReached(payload);
    })
  }
  //#endregion

  public connectAsUser(): void {
    const userId = this.authorizationService.getUserId();
    
    this.connectToHub().subscribe(_ => {
      this.connection.invoke("ConnectUser", userId);

      if (this.gameSessionId) {
        this.connection.invoke("ConnectToGameSession", this.gameSessionId);
      }
    })
  }

  public connectToGameSession(gameSessionIdString: string): void {
    if (this.connection.state == HubConnectionState.Connecting) {
      this.gameSessionId = gameSessionIdString;
      return;  
    }

    this.connection.invoke("ConnectToGameSession", gameSessionIdString);
  }

  public removeGameSessionConnection(gameSessionId: string): void {
    this.connection.invoke("DisconnectFromGameSession", gameSessionId);
  }

  public callMethod(methodName: string, ...args: any[]): void {
    this.connection.invoke(methodName, ...args);
  }

  private connectToHub(): Observable<void> {
      return from(this.connection.start()).pipe(
        tap(() => console.log('SignalR connected'))
      );
  }
}
