import { Injectable } from '@angular/core';
import { HttpService } from "./http.service";
import { Observable } from 'rxjs';
import { Friend } from '../models/friend';
import { AddFriendPayload } from '../models/payloads/add-friend';

@Injectable({
  providedIn: 'root'
})

export class FriendService {

  constructor (
    private httpService: HttpService
  ) { }

  public fetchFriends(): Observable<Friend[]> {
    return this.httpService.get('Friend', 'listFriends');
  }

  public addFriend(friend: AddFriendPayload): Observable<any> {
    console.log("friend service addFriend payload:", friend);
    return this.httpService.post('Friend', 'addFriend', friend);
  }

  public removeFriend(friend: Friend): Observable<any> {
    console.log("friend service remove payload:", friend);
    return this.httpService.post('Friend', 'removeFriend', friend);
    //remove
  }

 

  //public createSession(game: CreateGameSessionPayload): Observable<any> {
  //  return this.httpService.post('GameSession', 'createSession', game);
  //}
}
