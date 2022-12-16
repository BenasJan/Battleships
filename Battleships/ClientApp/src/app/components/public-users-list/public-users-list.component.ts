import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { AddFriendEvent } from '../../models/payloads/add-friend';
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
    private friendService: FriendService,
    private authorizationService: AuthorizationService
  ) { }

  ngOnInit(): void {
    this.playerService.getGlobalUsers().subscribe((res: User[]) => {
      this.users = res;
    })
  }

  addFriend(user: User): void {
    console.log("addFriend id:", user);
    const friend: AddFriendEvent = {
      initiatorUserId: this.authorizationService.getUserId(),
      targetUserId: user.id
    }

    this.friendService.addFriend(friend).subscribe(res => {
      user.isFriend = true;
      this.users = [...this.users]
    })
  }

  public removeUser(userId: string) {
    this.users = this.users.filter(user => user.id != userId);
  }
}
