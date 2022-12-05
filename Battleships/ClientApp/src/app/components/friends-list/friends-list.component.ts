import { Component, OnInit } from '@angular/core';
import { RemoveFriendEvent } from 'src/app/models/payloads/remove-friend-event';
import { AuthorizationService } from 'src/app/services/authorization.service';
import { Friend } from '../../models/friend';
import { FriendService } from '../../services/friend.service';


@Component({
  selector: 'app-friends-list',
  templateUrl: './friends-list.component.html'
})
export class FriendsListComponent implements OnInit {

  public friends: Friend[] = [];

  constructor(
    private friendService: FriendService,
    private authorizationService: AuthorizationService
  ) { }

  ngOnInit(): void {
    this.friendService.fetchFriends().subscribe((res: Friend[]) => {
      console.log(res);
      this.friends = res;
    })
  }

  removeFriend(friend: Friend): void {
    const event: RemoveFriendEvent = {
      friendId: friend.friendId,
      initiatorUserId: this.authorizationService.getUserId()
    };

    this.friendService.removeFriend(event).subscribe()
  }

}
