import { Injectable } from '@angular/core';
import { Observable } from "rxjs";
import { GameSession } from "../models/game-session";
import { LobySession } from "../models/lobby-session";
import { CreateGameSessionPayload } from "../models/payloads/create-game-session-payload";
import { HttpService } from "./http.service";

@Injectable({
  providedIn: 'root'
})
export class GameSessionService {

  constructor(
    private httpService: HttpService
  ) { }

  public fetchSessions(): Observable<GameSession[]> {
    return this.httpService.get('GameSession', 'listSessions');
  }

  public getSession(sessionId: string): Observable<LobySession> {
    return this.httpService.get('GameSession', 'getSession',{id: sessionId});
  }

  public createSession(game: CreateGameSessionPayload): Observable<any> {
    return this.httpService.post('GameSession', 'createSession', game);
  }

  public inviteUser(gameSessionId: string, userId: string): Observable<any> {
    return this.httpService.post('GameSession', `invite/${gameSessionId}`, { userId });
  }

  public launchGame(gameSessionId: string): Observable<any> {
    return this.httpService.post('GameSession', `launch-game/${gameSessionId}`)
  }

  public register(credentials: { email: string, password: string }): Observable<any> {
    return this.httpService.post<{ token: string }>('Authentication', 'register', credentials);
  }

}
