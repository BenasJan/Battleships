import { Injectable } from '@angular/core';
import { from, map, Observable, switchMap, tap } from 'rxjs';
import { AuthorizationService } from './authorization.service';
import { FriendsHubConnection } from './friends-hub-connection';
import { HttpService } from './http.service';
import { SignalRService } from './signal-r.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(
    private httpService: HttpService,
    private authorizationService: AuthorizationService,
    private signalRService: SignalRService
  ) { }

  public login(login: { email: string, password: string }): Observable<any> {    
    return this.httpService.post<{ token: string }>('Authentication', 'login', login).pipe(
      tap(response => this.authorizationService.registerToken(response.token)),
      tap(() => this.signalRService.connectAsUser()),
      switchMap(() => {
        const friendsConnection = FriendsHubConnection.getInstance();
        return from(friendsConnection.start())
      })
    );
  }

  public register(credentials: { email: string, password: string }): Observable<any> {
    return this.httpService.post<{ token: string }>('Authentication', 'register', credentials);
  }
}
