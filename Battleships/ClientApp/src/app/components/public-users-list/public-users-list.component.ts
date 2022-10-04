import { Component, OnInit } from '@angular/core';
import { HttpService } from "../../services/http.service";
import { PlayerService } from '../../services/player.service';
import { Player } from '../../models/player';


@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  public users: Player[] = [];

  constructor(private playerService: PlayerService) { }

  ngOnInit(): void {
    this.playerService.fetchPlayers().subscribe((res: Player[]) => {
      console.log(res);
      this.users = res;
    })
  }

}
