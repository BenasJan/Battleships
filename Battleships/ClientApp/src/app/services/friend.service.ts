import { Injectable } from '@angular/core';
import { HttpService } from "./http.service";
import { from, Observable } from 'rxjs';
import { Friend } from '../models/friend';
import { AddFriendEvent } from '../models/payloads/add-friend';
import { RemoveFriendEvent } from '../models/payloads/remove-friend-event';
import { HubConnection } from '@microsoft/signalr';
import { FriendsHubConnection } from './friends-hub-connection';

@Injectable({
  providedIn: 'root'
})

export class FriendService {

  private readonly signalRConnection: HubConnection;

  constructor (
    private httpService: HttpService
  ) {
    this.signalRConnection = FriendsHubConnection.getInstance();
  }

  public fetchFriends(): Observable<Friend[]> {
    return this.httpService.get('Friend', 'listFriends');
  }

  public addFriend(event: AddFriendEvent): Observable<any> {
    return from(this.signalRConnection.invoke("AddFriend", event));
  }

  public removeFriend(event: RemoveFriendEvent): Observable<any> {
    return from(this.signalRConnection.invoke("RemoveFriend", event));
  }
}
