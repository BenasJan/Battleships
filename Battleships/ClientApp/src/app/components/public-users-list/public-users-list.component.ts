import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Player } from '../../models/player';
import { PlayerService } from '../../services/player.service';
import jwt_decode from 'jwt-decode';
import {AuthorizationService} from "../../services/authorization.service";

@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  @Input() showHeader = true;
  @Input() showAddPlayerButton = false;
  @Input() excludeCurrUser = true;

  @Output() public addUserClicked = new EventEmitter<Player>();

  public users: Player[] = [];

  constructor(
    private playerService: PlayerService,
    private authorizationService: AuthorizationService
  ) { }

  ngOnInit(): void {
    this.playerService.fetchPlayers().subscribe((res: Player[]) => {
      this.users = res;
      // console.log(this.users);
    })

    // if(this.excludeCurrUser) {
    //   let token = jwt_decode(this.authorizationService.jwtToken!);
    //   if(token != null) {
    //     console.log("token: " + JSON.stringify(token));
    //   }
    // }

  }

  public removeUser(userId: string) {
    this.users = this.users.filter(user => user.id != userId);
  }

}
