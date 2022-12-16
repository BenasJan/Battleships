import { Component, OnInit } from '@angular/core';
import { from } from 'rxjs';
import { AuthorizationService } from './services/authorization.service';
import { FriendsConnectionService } from './services/friends-connection.service';
import { FriendsHubConnection } from './services/friends-hub-connection';
import { SignalRService } from './services/signal-r.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent implements OnInit {
  title = 'battleships';

  constructor(
    private readonly authorizationService: AuthorizationService,
    private readonly signalRService: SignalRService,
    private readonly friendsConnectionService: FriendsConnectionService
  ) { }

  ngOnInit(): void {
    this.authorizationService.intializeAuthorization();
    if (this.authorizationService.isAuthorized){
      this.signalRService.connectAsUser();
      this.friendsConnectionService.initializeConnection().subscribe();
    }
  }
}
