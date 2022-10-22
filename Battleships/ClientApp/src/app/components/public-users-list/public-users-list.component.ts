import { Component, OnInit } from '@angular/core';
import { HttpService } from "../../services/http.service";
import { PlayerService } from '../../services/player.service';
import { Player } from '../../models/player';
import { AddFriendPayload } from '../../models/payloads/add-friend';
import { FriendService } from '../../services/friend.service';



@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  public users: Player[] = [];

  constructor(private playerService: PlayerService, private friendService: FriendService) { }

  ngOnInit(): void {
    this.playerService.fetchPlayers().subscribe((res: Player[]) => {
      console.log(res);
      this.users = res;
    })
  }

  addFriend(userId: string): void {
    console.log("addFriend id:", userId);
    const friend: AddFriendPayload = {
      userId: userId
    }

    this.friendService.addFriend(friend).subscribe(res => {
      console.log("addFriend res:", res);
    })
  }

  //createSession(): void {
  //  const settings = {
  //    gridSize: this.gameSessionForm.get("gridSizeControl")?.value,
  //    gameType: Number(this.gameSessionForm.get("gameTypeControl")?.value)
  //  };
  //  const session: CreateGameSessionPayload = {
  //    icon: String(this.gameSessionForm.get("iconControl")?.value),
  //    name: String(this.gameSessionForm.get("nameControl")?.value),
  //    settingsDto: settings,
  //  };
  //  this.gameSessionService.createSession(session).subscribe(res => {
  //    console.log(res);
  //  })
  //}

}
