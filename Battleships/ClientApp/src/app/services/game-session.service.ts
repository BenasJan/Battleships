import { Injectable } from '@angular/core';
import {HttpService} from "./http.service";
import {Observable, tap} from "rxjs";
import {GameSession} from "../models/game-session";

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

  public createSession(game: GameSession): Observable<any> {
    return this.httpService.post('GameSession', 'createSession', game);
  }

  public register(credentials: { email: string, password: string }): Observable<any> {
    return this.httpService.post<{ token: string }>('Authentication', 'register', credentials);
  }

}
