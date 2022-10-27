import { Component, OnInit } from '@angular/core';
import { NumberValueAccessor } from '@angular/forms';

@Component({
  selector: 'app-game-session',
  templateUrl: './game-session.component.html',
  styleUrls: ['./game-session.component.scss']
})
export class GameSessionComponent implements OnInit {

  public columnCount: number;
  public rowCount: number;
  public tiles: any[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
