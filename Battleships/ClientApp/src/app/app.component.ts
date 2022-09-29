import { Component, OnInit } from '@angular/core';
import { AuthorizationService } from './services/authorization.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'battleships';

  constructor(
    private readonly authorizationService: AuthorizationService
  ) { }

  ngOnInit(): void {
    this.authorizationService.intializeAuthorization();
  }
}
