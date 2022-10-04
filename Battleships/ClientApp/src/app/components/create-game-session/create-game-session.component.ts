import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';
import {CreateGameSessionPayload} from "../../models/payloads/create-game-session-payload";
import {GameSessionService} from "../../services/game-session.service";

@Component({
  selector: 'app-create-game-session',
  templateUrl: './create-game-session.component.html',
  styleUrls: ['./create-game-session.component.scss']
})
export class CreateGameSessionComponent implements OnInit {

  public gameSessionForm = new FormGroup({
    iconControl: new FormControl('directions_boat'),
    nameControl: new FormControl('name?!'),
    gridSizeControl: new FormControl(''),
    gameTypeControl: new FormControl('')
  });

  constructor(
    public gameSessionService: GameSessionService
  ) { }

  ngOnInit(): void {
  }

  createSession(): void {
    const settingString = {
      "gridSize": this.gameSessionForm.get("gridSizeControl")?.value,
      "gameType": this.gameSessionForm.get("gameTypeControl")?.value
    };
    const session: CreateGameSessionPayload = {
      icon: String(this.gameSessionForm.get("iconControl")?.value),
      name: String(this.gameSessionForm.get("nameControl")?.value),
      settingsString: JSON.stringify(settingString),
    };
    console.log(session);
    this.gameSessionService.createSession(session).subscribe(res => {
      console.log(res);
    })
  }


}
