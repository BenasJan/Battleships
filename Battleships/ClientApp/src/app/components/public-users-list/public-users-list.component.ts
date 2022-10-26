import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Player } from '../../models/player';
import { PlayerService } from '../../services/player.service';

@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  @Input() showHeader = true;
  @Input() showAddPlayerButton = false;

  @Output() public addUserClicked = new EventEmitter<Player>();

  public users: Player[] = [];

  constructor(private playerService: PlayerService) { }

  ngOnInit(): void {
    this.playerService.fetchPlayers().subscribe((res: Player[]) => {
      console.log(res);
      this.users = res;
    })
  }

  public removeUser(userId: string) {
    this.users = this.users.filter(user => user.userId != userId);
  }

}
