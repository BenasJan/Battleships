import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AddFriendPayload } from '../../models/payloads/add-friend';
import { User } from '../../models/player';
import { FriendService } from '../../services/friend.service';
import { PlayerService } from '../../services/player.service';
@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html'
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
    private friendService: FriendService
  ) { }

  ngOnInit(): void {
    this.playerService.getGlobalUsers().subscribe((res: User[]) => {
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
