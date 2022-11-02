import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { tap } from 'rxjs';
import { User } from 'src/app/models/player';
import { SignalRService } from 'src/app/services/signal-r.service';
import { GameType } from "../../models/enums/game-type";
import { LobbyPlayer } from "../../models/lobby-player";
import { LobySession } from "../../models/lobby-session";
import { GameSessionService } from "../../services/game-session.service";
import { PlayerService } from "../../services/player.service";
import { ToastService } from "../../services/toast.service";
import { PublicUsersListComponent } from '../public-users-list/public-users-list.component';

@Component({
  selector: 'app-game-lobby',
  templateUrl: './game-lobby.component.html',
  styleUrls: ['./game-lobby.component.scss']
})
export class GameLobbyComponent implements OnInit {

  public players: LobbyPlayer[] = [];
  public lobbySession: LobySession = {} as LobySession;
  private sessionId = "";

  public availableUsers: User[] = [];

  @ViewChild(PublicUsersListComponent)
  private publicUsersListComponent: PublicUsersListComponent;

  constructor(
    public gameSessionService: GameSessionService,
    public playerService: PlayerService,
    private route: ActivatedRoute,
    private signalRService: SignalRService
  ) { }

  ngOnInit(): void {
    this.sessionId = this.route.snapshot.params['id'];
    this.getSession();
    this.playerService.getAvailableUsers(this.sessionId).subscribe(
      users => this.availableUsers = users
    )
    this.signalRService.connectToGameSession(this.sessionId);
  }

  getSession(){
    this.gameSessionService.getSession(this.sessionId).subscribe(res => {
     this.lobbySession = res;
     // console.log("AA");
      this.lobbySession.gameType = GameType[Number(res.gameType)];
     // console.log(this.lobbySession);
      }
    )
  }

  public addPlayer(user: User): void {
    this.gameSessionService.inviteUser(this.sessionId, user.id).pipe(
      tap(() => this.lobbySession.lobbyPlayers.push({ id: user.id, name: user.name })),
      tap(() => this.publicUsersListComponent.removeUser(user.id))
    ).subscribe()
  }

  public launchGame(): void {
    this.gameSessionService.launchGame(this.sessionId).subscribe();
  }
}
