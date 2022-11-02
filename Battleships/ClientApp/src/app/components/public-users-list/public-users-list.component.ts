import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { User } from '../../models/player';
import { AuthorizationService } from "../../services/authorization.service";
import { PlayerService } from '../../services/player.service';

@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  @Input() set setUsers(users: User[]) {
    if (users) {
      this.users = users;
    }
  }
  @Input() showHeader = true;
  @Input() showAddPlayerButton = false;

  @Output() public addUserClicked = new EventEmitter<User>();

  public users: User[] = [];

  constructor(
    private playerService: PlayerService,
    private authorizationService: AuthorizationService
  ) { }

  ngOnInit(): void {
    const isLobby = !this.showHeader && this.showAddPlayerButton;

    if (!isLobby) {
      this.playerService.getGlobalUsers().subscribe((res: User[]) => {
        this.users = res;
      })
    }
  }

  public removeUser(userId: string) {
    this.users = this.users.filter(user => user.id != userId);
  }

}
