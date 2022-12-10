import { Injectable } from '@angular/core';
import { from, Observable, switchMap, tap } from 'rxjs';
import { AuthorizationService } from './authorization.service';
import { FriendsHubConnection } from './friends-hub-connection';
import { ToastService } from './toast.service';

@Injectable({
  providedIn: 'root'
})
export class FriendsConnectionService {

  constructor(
    private readonly toastService: ToastService,
    private readonly authorizationService: AuthorizationService
  ) { }

  public initializeConnection(): Observable<void> {
    const connection = FriendsHubConnection.getInstance();

    connection.on("friendLost", payload => {
      this.toastService.publish(`Your friend ${payload.friendName} has lost a game :(`);
    });

    connection.on("friendWon", payload => {
      this.toastService.publish(`Your friend ${payload.friendName} has won a game!`);
    });

    return from(connection.start()).pipe(
        switchMap(() => from(connection.invoke("ConnectToHub", this.authorizationService.getUserId())))
    );
  }
}
