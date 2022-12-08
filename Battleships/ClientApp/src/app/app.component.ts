import { Component, OnInit } from '@angular/core';
import { from } from 'rxjs';
import { AuthorizationService } from './services/authorization.service';
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
    private readonly signalRService: SignalRService
  ) { }

  ngOnInit(): void {
    this.authorizationService.intializeAuthorization();
    if (this.authorizationService.isAuthorized){
      this.signalRService.connectAsUser();
      const connection = FriendsHubConnection.getInstance();
      from(connection.start()).subscribe(); 
    }
  }
}
