import { Component, OnDestroy, OnInit } from '@angular/core';
import { NumberValueAccessor } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { tap } from 'rxjs';
import { Attack } from 'src/app/models/attack';
import { InGameSession } from 'src/app/models/in-game-session';
import { AttackMovesObserver } from 'src/app/observer/attack-moves-observer';
import { AttackPublishingService } from 'src/app/services/attack-publishing.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { GameSessionService } from 'src/app/services/game-session.service';
import { MoveSubmissionEventsService } from 'src/app/services/move-submission.service';
import { ShipMove } from '../../models/ship-move';

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
  public selectedShipId = "";

  public tiles: any[] = [];
  private attacksObserver: AttackMovesObserver;

  constructor(
    private readonly activatedRoute: ActivatedRoute,
    private readonly gameSessionService: GameSessionService,
    private readonly authorizationService: AuthorizationService,
    private readonly attackPublishingService: AttackPublishingService,
    private readonly moveSubmissionEventsService: MoveSubmissionEventsService
  ) { }

  ngOnInit(): void {
    this.gameSessionId = this.activatedRoute.snapshot.params['id'];
    
    this.gameSessionService.getGameplaySession(this.gameSessionId).pipe(
      tap(session => this.gameSession = session)
    ).subscribe(session => {
      let selectedShip = session.ownTiles.find(x => x.shipId != null)
      this.selectedShipId = selectedShip?.shipId ? selectedShip?.shipId : "";
      console.log(this.selectedShipId);
    })

    this.attacksObserver = this.moveSubmissionEventsService.onMoveSubmitted((xCoord, yCoord) => {
      this.gameSession.currentRound++;
      
    })
  }

  ngOnDestroy(): void {
    this.moveSubmissionEventsService.discardOnMovesSubmitted(this.attacksObserver);
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

  public MoveShip(shipId: string, direction: string) {
    debugger;

    const shipMove: ShipMove = {
      gameSessionId: this.gameSessionId,
      shipId: shipId,
      direction: direction
    }
    this.gameSessionService.moveShip(shipMove);
  }
}
