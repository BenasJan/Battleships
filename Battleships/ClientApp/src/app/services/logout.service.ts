import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { from, switchMap, tap } from 'rxjs';
import { AuthorizationService } from './authorization.service';
import { FriendsHubConnection } from './friends-hub-connection';
import { SignalRConnection } from './signal-r-connection';

@Injectable({
  providedIn: 'root'
})
export class LogoutService {

  constructor(
    private readonly authorizationService: AuthorizationService,
    private readonly router: Router
  ) { }

  public logout(): void {
    this.authorizationService.clearToken();
    from(SignalRConnection.getInstance().stop()).pipe(
      switchMap(() => from(FriendsHubConnection.getInstance().stop())),
      tap(() => this.router.navigateByUrl('/login'))
    ).subscribe();
  }
}
