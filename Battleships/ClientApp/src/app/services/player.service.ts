import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from "../models/player";
import { HttpService } from "./http.service";

@Injectable({
  providedIn: 'root'
})

export class PlayerService {

  constructor (
    private httpService: HttpService
  ) { }

  public getGlobalUsers(): Observable<User[]> {
    return this.httpService.get('Player', 'all-users');
  }

  public getAvailableUsers(gameSessionId: string): Observable<User[]> {
    return this.httpService.get('Player', 'lobby-users', { gameSessionId });
  }
}
