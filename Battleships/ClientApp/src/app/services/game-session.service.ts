import { Injectable } from '@angular/core';
import {HttpService} from "./http.service";
import {Observable, tap} from "rxjs";
import {GameSession} from "../models/game-session";
import {CreateGameSessionPayload} from "../models/payloads/create-game-session-payload";
import {LobySession} from "../models/lobby-session";

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

  public register(credentials: { email: string, password: string }): Observable<any> {
    return this.httpService.post<{ token: string }>('Authentication', 'register', credentials);
  }

}
