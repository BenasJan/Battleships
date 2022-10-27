import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Player } from 'src/app/models/player';
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

  @ViewChild(PublicUsersListComponent)
  private publicUsersListComponent: PublicUsersListComponent | undefined;

  constructor(
    public gameSessionService: GameSessionService,
    public playerService: PlayerService,
    private readonly toastService: ToastService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.sessionId = this.route.snapshot.params['id'];
    this.getSession();
    // TODO: PAFIXINT BACKA KUR TRAUKIA PLAYERIUS TEN REIK .Include DADET KAD IMTU APPLICATIONUSERIO NAME
    // this.getPlayers();
  }

  getSession(){
    this.gameSessionService.getSession(this.sessionId).subscribe(res => {
     this.lobbySession = res;
     console.log("AA");
      this.lobbySession.gameType = GameType[Number(res.gameType)];
     console.log(this.lobbySession);
      }
    )
  }

  getPlayers() {
    this.playerService.fetchLobbyPlayers().subscribe(res => {
      console.log(res);
      this.players = res;
      // res.map((value, index) => {
      //   let lobbyPlayer: LobbyPlayer;
      //   lobbyPlayer.name = value.name;
      //   this.players.push()
      // })
    })
  }

  public addPlayer(player: Player): void {
    // this.lobbySession.players.push({
    //   id: player.userId,
    //   name: player.name
    // })
  console.log(player);

    this.gameSessionService.addPlayerToSession({
      userId: player.userId,
      name: player.name,
      sessionId: this.sessionId
    }).subscribe(res => {
      console.log("addded player: ");
      console.log(res);
    })
    // this.publicUsersListComponent?.removeUser(player.userId);
  }

  public launchGame(): void {

  }
}
