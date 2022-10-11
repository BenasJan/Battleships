import { Injectable } from '@angular/core';
import { HttpService } from "./http.service";
import { Player } from "../models/player";
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class PlayerService {

  constructor (
    private httpService: HttpService
  ) { }

  public fetchPlayers(): Observable<Player[]> {
    return this.httpService.get('Player', 'listPlayers');
  }
}
