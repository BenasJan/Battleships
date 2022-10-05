import { Component, OnInit } from '@angular/core';
import { GameSession } from "../../models/game-session";
import { GameSessionService } from "../../services/game-session.service";
import {GameType} from "../../models/enums/game-type";

@Component({
  selector: 'app-public-games-list',
  templateUrl: './public-games-list.component.html',
  styleUrls: ['./public-games-list.component.scss']
})
export class PublicGamesListComponent implements OnInit {

  public games: GameSession[] = [];

  constructor(private gameSessionService: GameSessionService) {}

  ngOnInit(): void {
    this.gameSessionService.fetchSessions().subscribe((res: GameSession[]) => {
      console.log(res);
      this.games = res.map( e => ({
        ...e,
        gameType: GameType[Number(e.gameType)]
      }));
    });
  }
}
