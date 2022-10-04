import { Component, OnInit } from '@angular/core';
import { GameSession } from "../../models/game-session";
import { GameSessionService } from "../../services/game-session.service";

@Component({
  selector: 'app-public-games-list',
  templateUrl: './public-games-list.component.html',
  styleUrls: ['./public-games-list.component.scss']
})
export class PublicGamesListComponent implements OnInit {

  public games = [
    { icon: 'directions_boat', name: 'Pearl harbour', gridSize: '5x6', settingsString: 'Deathmatch', hostName: 'Benas Janušonis' },
    { icon: 'directions_boat', name: 'pavadinimas', gridSize: '10x10', settingsString: 'Classic', hostName: 'Kajus Knoras' },
    { icon: 'directions_boat', name: 'asfhsdjkg', gridSize: '5x12', settingsString: 'Classic', hostName: 'Vladislav ryžovas' },
    { icon: 'directions_boat', name: 'musis_123', gridSize: '12x6', settingsString: 'Classic', hostName: 'Deividas Ambrozaitis' },
    { icon: 'directions_boat', name: 'Pasitaškom', gridSize: '4x5', settingsString: 'Classic', hostName: 'Eligijus Anilionis' },
    { icon: 'directions_boat', name: 'Pearl harbour', gridSize: '20x10', settingsString: 'Custom', hostName: 'Vaida Vasiliauskaite' },
    { icon: 'directions_boat', name: 'Ateikit zaist', gridSize: '12x2', settingsString: 'Limited time', hostName: 'Tomas Venslova' },
    { icon: 'directions_boat', name: 'Cool game xDD', gridSize: '5x6', settingsString: 'Deathmatch', hostName: 'Raminta Valaitytė' },
  ]

  public games2: GameSession[] = [];

  constructor(private gameSessionService: GameSessionService) {}

  ngOnInit(): void {
    this.gameSessionService.fetchSessions().subscribe((res: GameSession[]) => {
      console.log(res);
      this.games2 = res;
    });
  }
}
