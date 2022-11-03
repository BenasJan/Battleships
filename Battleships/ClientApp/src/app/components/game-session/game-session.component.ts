import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { tap } from 'rxjs';
import { Attack } from 'src/app/models/attack';
import { InGameSession } from 'src/app/models/in-game-session';
import { AttackMovesObserver } from 'src/app/observer/attack-moves-observer';
import { AttackPublishingService } from 'src/app/services/attack-publishing.service';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { GameSessionEventsService } from 'src/app/services/game-session-events.service';
import { GameSessionService } from 'src/app/services/game-session.service';

@Component({
  selector: 'app-game-session',
  templateUrl: './game-session.component.html',
  styleUrls: ['./game-session.component.scss']
})
export class GameSessionComponent implements OnInit, OnDestroy {

  public gameSessionId: string;
  public selectedMoveXCoord: number;
  public selectedMoveYCoord: number;

  public gameSession = {} as InGameSession;

  public tiles: any[] = [];
  private ownMovesObserver: AttackMovesObserver;
  private opponentMovesObserver: AttackMovesObserver;

  constructor(
    private readonly activatedRoute: ActivatedRoute,
    private readonly gameSessionService: GameSessionService,
    private readonly authorizationService: AuthorizationService,
    private readonly attackPublishingService: AttackPublishingService,
    private readonly gameSessionEventsService: GameSessionEventsService
  ) { }

  ngOnInit(): void {
    this.gameSessionId = this.activatedRoute.snapshot.params['id'];
    
    this.gameSessionService.getGameplaySession(this.gameSessionId).pipe(
      tap(session => this.gameSession = session)
    ).subscribe();

    this.ownMovesObserver = this.gameSessionEventsService.onOwnMoveSubmitted((_, __) => {
      this.gameSession.currentRound++;
    })

    this.opponentMovesObserver = this.gameSessionEventsService.onOpponentMoveSubmitted((xCorrd, yCoord) => {
      this.gameSession.currentRound++;

      const destroyedTile = this.gameSession.ownTiles.find(tile => tile.columnCoordinate == xCorrd && tile.rowCoordinate == yCoord);
      
      if (destroyedTile) {
        destroyedTile.isDestroyed = true;
        this.gameSession = { ...this.gameSession };
      }
    })
  }

  ngOnDestroy(): void {
    this.gameSessionEventsService.discardOwnMovesObserver(this.ownMovesObserver);
    this.gameSessionEventsService.discardOpponentMovesObserver(this.opponentMovesObserver);
  }

  public get isMoveSelected(): boolean {
    return !!this.selectedMoveXCoord || !!this.selectedMoveYCoord;
  }

  public submitMove(): void {
    const attack: Attack = {
      gameSessionId: this.gameSessionId,
      attackingUserId: this.authorizationService.getUserId(),
      targetXCoordinate: this.selectedMoveXCoord,
      targetYCoordinate: this.selectedMoveYCoord
    };

    this.attackPublishingService.publishAttack(attack);
  }
}
