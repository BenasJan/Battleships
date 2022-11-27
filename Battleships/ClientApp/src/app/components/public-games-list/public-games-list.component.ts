import { Component, OnInit } from '@angular/core';
import { GameType } from "../../models/enums/game-type";
import { GameSession } from "../../models/game-session";
import { GameSessionService } from "../../services/game-session.service";

@Component({
  selector: 'app-public-games-list',
  templateUrl: './public-games-list.component.html'
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
