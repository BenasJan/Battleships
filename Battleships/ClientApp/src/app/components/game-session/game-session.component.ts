import { Component, HostListener, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { switchMap, tap } from 'rxjs';
import { Attack } from 'src/app/models/attack';
import { GameTile, InGameSession } from 'src/app/models/in-game-session';
import { AttackMovesObserver } from 'src/app/observer/attack-moves-observer';
import { EndgameReachedObserver } from 'src/app/observer/endgame-reached-observer';
import { AttackPublishingService } from 'src/app/services/attack-publishing.service';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { GameSessionEventsService } from 'src/app/services/game-session-events.service';
import { GameSessionService } from 'src/app/services/game-session.service';
import { WInput } from '../../interpreter/w-input';
import { SInput } from '../../interpreter/s-input';
import { AInput } from '../../interpreter/a-input';
import { DInput } from '../../interpreter/d-input';
import { SignalRService } from '../../services/signal-r.service';
import {GameStyleState} from "../../states/GameStyleState";
import {WhiteState} from "../../states/WhiteState";
import { EnterInput } from 'src/app/interpreter/enter-input';

@Component({
  selector: 'app-game-session',
  templateUrl: './game-session.component.html',
  styleUrls: ['./game-session.component.scss']
})
export class GameSessionComponent implements OnInit, OnDestroy {

  public backgroundColor: string;

  public styleState: GameStyleState;

  public gameSessionId: string;
  public selectedMoveXCoord: number | null;
  public selectedMoveYCoord: number | null;

  public selectedShipXCoord: number;
  public selectedShipYCoord: number;
  private shipIdStagedForMove: string | null;

  public color: string = "white";
  public chanceToMiss: number = 0;

  public gameSession = {} as InGameSession;
  public selectedShipId = "";
  public isOwnTurn: boolean;

  private ownMovesObserver: AttackMovesObserver;
  private opponentMovesObserver: AttackMovesObserver;
  private endgameObserver: EndgameReachedObserver;

  //private redInput: RedInput;
  //private blueInput: BlueInput;
  private dInput: DInput;
  private aInput: AInput;
  private sInput: SInput;
  private wInput: WInput;
  private enterInput: EnterInput;

  public endgameReached: boolean;
  public winnerName: string;

  public attackInSubmission = false;

  constructor(
    private readonly activatedRoute: ActivatedRoute,
    private readonly gameSessionService: GameSessionService,
    private readonly authorizationService: AuthorizationService,
    private readonly attackPublishingService: AttackPublishingService,
    private readonly gameSessionEventsService: GameSessionEventsService,
    private readonly signalRService: SignalRService
  ) { }

  @HostListener('document:keypress', ['$event'])
  handleKeyboardEvent(event: KeyboardEvent) {
    console.log(event)
    if (!this.isOwnTurn || this.endgameReached) {
      return;
    }

    if (this.shipIdStagedForMove){
      let direction = 0;

      if (event.key === "8") {
        direction = 3;
        this.submitShipMove(direction);
      }
      if (event.key === "4") {
        direction = 1;
        this.submitShipMove(direction);
      }
      if (event.key === "2") {
        direction = 4;
        this.submitShipMove(direction);
      }
      if (event.key === "6") {
        direction = 2;
        this.submitShipMove(direction);
      }

      return;
    }

    if (event.key == 'd') {
      if (this.selectedMoveYCoord != null && this.selectedMoveXCoord != null) {
        console.log(event.key);
        this.selectedMoveYCoord += 1;
        this.dInput.Interpret(this.selectedMoveYCoord, this.selectedMoveXCoord, this.gameSession);
      }
    }
    if (event.key == 'a') {
      if (this.selectedMoveYCoord != null && this.selectedMoveXCoord != null) {
        console.log(event.key);
        this.selectedMoveYCoord -= 1;
        this.aInput.Interpret(this.selectedMoveYCoord, this.selectedMoveXCoord, this.gameSession);
      }
    }
    if (event.key == 's') {
      if (this.selectedMoveYCoord != null && this.selectedMoveXCoord != null) {
        console.log(event.key);
        this.selectedMoveXCoord += 1;
        this.sInput.Interpret(this.selectedMoveYCoord, this.selectedMoveXCoord, this.gameSession);
      }
    }
    if (event.key == 'w') {
      if (this.selectedMoveYCoord != null && this.selectedMoveXCoord != null) {
        console.log(event.key);
        this.selectedMoveXCoord -= 1;
        this.wInput.Interpret(this.selectedMoveYCoord, this.selectedMoveXCoord, this.gameSession);
      }
    }
    if (event.key == 'Enter') {
      if (this.selectedMoveYCoord != null && this.selectedMoveXCoord != null) {
        console.log(event.key);
        this.enterInput.Interpret(this.selectedMoveYCoord, this.selectedMoveXCoord, this.gameSession);
      }
    }

    //if (event.key == 'r') {
    //  this.redInput.Interpret(event);
    //}
    //else if (event.key == 'b') {
    //  this.blueInput.Interpret(event);
    //}
  }

  // public changeColor(): void {
  //   this.styleState = this.styleState.changeColor();
  //   console.log("FONO KOLORAS: " + this.color)
  // }

  private submitShipMove(direction: number): void {
    this.signalRService.callMethodObs("MoveShip", {
      initiatorUserId: this.authorizationService.getUserId(),
      gameSessionId: this.gameSessionId,
      playerShipId: this.shipIdStagedForMove,
      direction: direction
    }).pipe(
      switchMap(() => this.gameSessionService.getGameplaySession(this.gameSessionId)),
      tap(session => this.gameSession = session),
      tap(_ => this.shipIdStagedForMove = null)
    ).subscribe();
  }

  ngOnInit(): void {
     this.backgroundColor = 'white';
     //this.redInput = new RedInput(this);
    //this.blueInput = new BlueInput(this);
    this.dInput = new DInput(this, this.gameSession);
    this.wInput = new WInput(this, this.gameSession);
    this.sInput = new SInput(this, this.gameSession);
    this.aInput = new AInput(this, this.gameSession);
    this.enterInput = new EnterInput(this, this.gameSession);

    this.styleState = new WhiteState(this);
    console.log("stateas D: " + this.color);
    this.gameSessionId = this.activatedRoute.snapshot.params['id'];

    this.gameSessionService.getGameplaySession(this.gameSessionId).pipe(
      tap(session => this.gameSession = session),
      tap(session => this.isOwnTurn = session.currentRoundPlayerUserId == this.authorizationService.getUserId())
    ).subscribe(session => {
      console.log(session);
      let selectedShip = session.ownTiles.find(x => x.shipId != null)
      this.selectedShipId = selectedShip?.shipId ? selectedShip?.shipId : "";
    })

    this.ownMovesObserver = this.gameSessionEventsService.onOwnMoveSubmitted((xCorrd, yCoord) => {
      this.gameSession.currentRound++;
      this.changeGameSessionState();
      const destroyedTile = this.gameSession.opponentTiles.find(tile => tile.columnCoordinate == xCorrd && tile.rowCoordinate == yCoord);

      if (destroyedTile) {
        destroyedTile.isDestroyed = true;
        this.gameSession = { ...this.gameSession };
      }

      this.isOwnTurn = false;

      this.attackInSubmission = false;
      this.selectedMoveXCoord = null;
      this.selectedMoveYCoord = null;
      this.gameSession.opponentTiles.forEach(t => t.isSelected = false);
    })

    this.opponentMovesObserver = this.gameSessionEventsService.onOpponentMoveSubmitted((xCorrd, yCoord) => {
      this.gameSession.currentRound++;
      this.changeGameSessionState();

      const destroyedTile = this.gameSession.ownTiles.find(tile => tile.columnCoordinate == xCorrd && tile.rowCoordinate == yCoord);

      if (destroyedTile) {
        destroyedTile.isDestroyed = true;
        this.gameSession = { ...this.gameSession };
      }

      this.isOwnTurn = true;
    })

    this.endgameObserver = this.gameSessionEventsService.onEndgameReached(endgame => {
      if (this.gameSessionId == endgame.gameSessionId) {
        this.endgameReached = true;
        this.winnerName = endgame.winnerName;
      }
    })

    this.signalRService.connectToGameSession(this.gameSessionId);
  }

  private changeGameSessionState(): void {
    // switch (this.gameSession.currentRound) {
    //   case 5:
    //     this.styleState.changeState();
    //
    // }
    //
    console.log("round: " + this.gameSession.currentRound);
    if(this.gameSession.currentRound % 5 == 0)
      this.styleState.changeState();

  }

  ngOnDestroy(): void {
    this.gameSessionEventsService.discardOwnMovesObserver(this.ownMovesObserver);
    this.gameSessionEventsService.discardOpponentMovesObserver(this.opponentMovesObserver);
    this.gameSessionEventsService.discardEndgameReachedObserver(this.endgameObserver);
  }

  public get isMoveSelected(): boolean {
    return !!this.selectedMoveXCoord || !!this.selectedMoveYCoord;
  }

  public stageAttack(tile: GameTile): void {
    if (!this.isOwnTurn || this.endgameReached) {
      return;
    }

    this.gameSession.opponentTiles.forEach(t => t.isSelected = false);
    tile.isSelected = true;

    this.selectedMoveXCoord = tile.columnCoordinate;
    this.selectedMoveYCoord = tile.rowCoordinate;
  }

  public submitAttack(): void {
    let isMissed = false;
    if(Math.floor(Math.random() * 100) + 1 < this.chanceToMiss) {
      console.log("You misssed");
      isMissed = true;
    }

    this.attackInSubmission = true;
    const attack: Attack = {
      gameSessionId: this.gameSessionId,
      initiatorUserId: this.authorizationService.getUserId(),
      targetYCoordinate: this.selectedMoveYCoord as number,
      targetXCoordinate: this.selectedMoveXCoord as number,
      missed: isMissed
    };

    this.attackPublishingService.publishAttack(attack);


  }

  public stageShipMove(ownTile: GameTile): void {
    this.gameSession.ownTiles.forEach(tile => {
      if (ownTile.shipId) {
        tile.isStagedForMove = tile.shipId == ownTile.shipId
        this.shipIdStagedForMove = ownTile.shipId;
      } else {
        tile.isStagedForMove = false;
        this.shipIdStagedForMove = null;
      }
    });
  }
}
