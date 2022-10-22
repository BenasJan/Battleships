import { Component, OnInit } from '@angular/core';
import { Friend } from '../../models/friend';
import { FriendService } from '../../services/friend.service';


@Component({
  selector: 'app-friends-list',
  templateUrl: './friends-list.component.html',
  styleUrls: ['./friends-list.component.scss']
})
export class FriendsListComponent implements OnInit {

  //public friends = [
  //  {icon: 'person', name: 'Kajus Knoras', gamesPlayedCount: 10, gamesWonCount: 5 },
  //  {icon: 'person', name: 'Vladislav ryžovas', gamesPlayedCount: 2, gamesWonCount: 2 },
  //  {icon: 'person', name: 'Tomas Venslova', gamesPlayedCount: 3, gamesWonCount: 3 },
  //  {icon: 'person', name: 'Raminta Valaitytė', gamesPlayedCount: 5, gamesWonCount: 4 },
  //]

  public friends: Friend[] = [];

  constructor(private friendService: FriendService) { }

  ngOnInit(): void {
    this.friendService.fetchFriends().subscribe((res: Friend[]) => {
      console.log(res);
      this.friends = res;
    })
  }

  removeFriend(friend: Friend): void {
    console.log("addFriend id:", friend);

    this.friendService.removeFriend(friend).subscribe(res => {
      console.log("addFriend res:", res);
    })
  }

}
