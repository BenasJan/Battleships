import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from "@angular/router";
import { CreateGameSessionPayload } from "../../models/payloads/create-game-session-payload";
import { GameSessionService } from "../../services/game-session.service";
import { ToastService } from "../../services/toast.service";

@Component({
  selector: 'app-create-game-session',
  templateUrl: './create-game-session.component.html'
})
export class CreateGameSessionComponent {

  public gameSessionForm = new FormGroup({
    iconControl: new FormControl('directions_boat'),
    nameControl: new FormControl('', [
      Validators.required,
      Validators.minLength(4)]),
    rowCount: new FormControl('', [
      Validators.required,
      Validators.min(10)]),
    columnCount: new FormControl('', [
      Validators.required,
      Validators.min(10)]),
    gameTypeControl: new FormControl('')
  });

  constructor(
    public gameSessionService: GameSessionService,
    private readonly toastService: ToastService,
    private readonly router: Router
  ) { }

  createSession(): void {
    const settings = {
      rowCount: Number(this.gameSessionForm.get('rowCount')?.value),
      columnCount: Number(this.gameSessionForm.get('columnCount')?.value),
      gameType: Number(this.gameSessionForm.get("gameTypeControl")?.value)
    };
    const session: CreateGameSessionPayload = {
      icon: String(this.gameSessionForm.get("iconControl")?.value),
      name: String(this.gameSessionForm.get("nameControl")?.value),
      settingsDto: settings,
    };
    this.gameSessionService.createSession(session).subscribe(res => {
        this.toastService.publish('Session created successfully');
        this.router.navigate(['/lobby', res]);
    })
  }


}
