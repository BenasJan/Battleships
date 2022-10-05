import { Component, OnInit } from '@angular/core';
import { AuthorizationService } from './services/authorization.service';
import { SignalRService } from './services/signal-r.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'battleships';

  constructor(
    private readonly authorizationService: AuthorizationService,
    private readonly signalRService: SignalRService
  ) { }

  ngOnInit(): void {
    this.authorizationService.intializeAuthorization();
    this.signalRService.initializeSignalR();
  }
}
