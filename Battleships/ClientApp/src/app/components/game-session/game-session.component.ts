import { Component, OnDestroy, OnInit, HostListener } from '@angular/core';
import { NumberValueAccessor } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { tap } from 'rxjs';
import { Attack } from 'src/app/models/attack';
import { GameTile, InGameSession } from 'src/app/models/in-game-session';
import { AttackMovesObserver } from 'src/app/observer/attack-moves-observer';
import { EndgameReachedObserver } from 'src/app/observer/endgame-reached-observer';
import { AttackPublishingService } from 'src/app/services/attack-publishing.service';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { GameSessionEventsService } from 'src/app/services/game-session-events.service';
import { GameSessionService } from 'src/app/services/game-session.service';
//import { MoveSubmissionEventsService } from 'src/app/services/move-submission.service';
import { ShipMove } from '../../models/ship-move';
import { SignalRService } from '../../services/signal-r.service';

@Component({
  selector: 'app-game-session',
  templateUrl: './game-session.component.html',
  styleUrls: ['./game-session.component.scss']
})
export class GameSessionComponent implements OnInit, OnDestroy {

  public gameSessionId: string;
  public selectedMoveXCoord: number | null;
  public selectedMoveYCoord: number | null;

  public gameSession = {} as InGameSession;
  public selectedShipId = "";
  public isOwnTurn: boolean;

  private ownMovesObserver: AttackMovesObserver;
  private opponentMovesObserver: AttackMovesObserver;
  private endgameObserver: EndgameReachedObserver;
  public endgameReached: boolean;

  public attackInSubmission = false;

  constructor(
    private readonly activatedRoute: ActivatedRoute,
    private readonly gameSessionService: GameSessionService,
    private readonly authorizationService: AuthorizationService,
    private readonly attackPublishingService: AttackPublishingService,
    private readonly gameSessionEventsService: GameSessionEventsService,
    private readonly signalRService: SignalRService
  ) { }

  ngOnInit(): void {
    this.gameSessionId = this.activatedRoute.snapshot.params['id'];
    
    this.gameSessionService.getGameplaySession(this.gameSessionId).pipe(
      tap(session => this.gameSession = session),
      tap(session => this.isOwnTurn = session.currentRoundPlayerUserId == this.authorizationService.getUserId())
    ).subscribe(session => {
      console.log(session);
      let selectedShip = session.ownTiles.find(x => x.shipId != null)
      this.selectedShipId = selectedShip?.shipId ? selectedShip?.shipId : "";
    })

    this.ownMovesObserver = this.gameSessionEventsService.onOwnMoveSubmitted((_, __) => {
      this.gameSession.currentRound++;
      this.isOwnTurn = false;
      this.attackInSubmission = false;
      this.selectedMoveXCoord = null;
      this.selectedMoveYCoord = null;
    })

    this.opponentMovesObserver = this.gameSessionEventsService.onOpponentMoveSubmitted((xCorrd, yCoord) => {
      this.gameSession.currentRound++;

      const destroyedTile = this.gameSession.ownTiles.find(tile => tile.columnCoordinate == xCorrd && tile.rowCoordinate == yCoord);
      
      if (destroyedTile) {
        destroyedTile.isDestroyed = true;
        this.gameSession = { ...this.gameSession };
      }

      this.isOwnTurn = true;
    })

    this.endgameObserver = this.gameSessionEventsService.onEndgameReached(sessionId => {
      if (this.gameSessionId == sessionId) {
        this.endgameReached = true;
      }
    })

    this.signalRService.connectToGameSession(this.gameSessionId);
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
    this.selectedMoveXCoord = tile.columnCoordinate;
    this.selectedMoveYCoord = tile.rowCoordinate;
  }

  public submitAttack(): void {
    this.attackInSubmission = true;
    const attack: Attack = {
      gameSessionId: this.gameSessionId,
      attackingUserId: this.authorizationService.getUserId(),
      targetYCoordinate: this.selectedMoveYCoord as number,
      targetXCoordinate: this.selectedMoveXCoord as number
    };

    this.attackPublishingService.publishAttack(attack);


  }

  //public MoveShip(shipId: string, direction: string) {

  //  const shipMove: ShipMove = {
  //    gameSessionId: this.gameSessionId,
  //    shipId: shipId,
  //    direction: direction
  //  }
  //  this.gameSessionService.moveShip(shipMove).subscribe(() => location.reload());
  //}

  @HostListener('document:keydown', ['$event'])
  handleKeyboardEvent(event: KeyboardEvent) {
    const shipMove: ShipMove = {
      gameSessionId: this.gameSessionId,
      shipId: this.selectedShipId,
      direction: ""
    }

    switch (event.keyCode) {
      case 37:
        shipMove.direction = "Left"
        this.gameSessionService.moveShip(shipMove).subscribe((session) => this.gameSession = session);
        break;
      case 38:
        shipMove.direction = "Up"
        this.gameSessionService.moveShip(shipMove).subscribe((session) => this.gameSession = session);
        break;
      case 39:
        shipMove.direction = "Right"
        this.gameSessionService.moveShip(shipMove).subscribe((session) => this.gameSession = session);
        break;
      case 40:
        shipMove.direction = "Down"
        this.gameSessionService.moveShip(shipMove).subscribe((session) => this.gameSession = session);
        break;
      
    }
  }
}
