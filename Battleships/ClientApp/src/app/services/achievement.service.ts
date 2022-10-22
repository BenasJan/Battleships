import { Injectable } from '@angular/core';
import { HttpService } from "./http.service";
import { Achievement } from "../models/achievement";
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class AchievementService {

  constructor (
    private httpService: HttpService
  ) { }

  public fetchAchievements(): Observable<Achievement[]> {
    return this.httpService.get('Achievement', 'listAchievements');
  }
}
