import { Component, OnDestroy, OnInit } from '@angular/core';
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

    this.ownMovesObserver = this.gameSessionEventsService.onOwnMoveSubmitted((xCorrd, yCoord) => {
      this.gameSession.currentRound++;
      
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
    this.attackInSubmission = true;
    const attack: Attack = {
      gameSessionId: this.gameSessionId,
      attackingUserId: this.authorizationService.getUserId(),
      targetYCoordinate: this.selectedMoveYCoord as number,
      targetXCoordinate: this.selectedMoveXCoord as number
    };

    this.attackPublishingService.publishAttack(attack);


  }
}
