import { Component, OnInit } from '@angular/core';
import {GameSessionService} from "../../services/game-session.service";
import {ToastService} from "../../services/toast.service";
import {GameSession} from "../../models/game-session";
import {Player} from "../../models/player";
import {LobbyPlayer} from "../../models/lobby-player";
import {ActivatedRoute} from "@angular/router";
import {LobySession} from "../../models/lobby-session";
import {GameType} from "../../models/enums/game-type";
import {PlayerService} from "../../services/player.service";

@Component({
  selector: 'app-game-lobby',
  templateUrl: './game-lobby.component.html',
  styleUrls: ['./game-lobby.component.scss']
})
export class GameLobbyComponent implements OnInit {

  public players: LobbyPlayer[] = [];
  public lobbySession: LobySession = {} as LobySession;

  constructor(
    public gameSessionService: GameSessionService,
    public playerService: PlayerService,
    private readonly toastService: ToastService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.getSession();
    // TODO: PAFIXINT BACKA KUR TRAUKIA PLAYERIUS TEN REIK .Include DADET KAD IMTU APPLICATIONUSERIO NAME
    // this.getPlayers();
  }

  getSession(){
    this.gameSessionService.getSession(this.route.snapshot.params['id']).subscribe(res => {
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
}
