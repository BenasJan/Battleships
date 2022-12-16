import { Component } from '@angular/core';
import { LogoutService } from 'src/app/services/logout.service';

@Component({
  selector: 'app-app-container',
  templateUrl: './app-container.component.html',
  styleUrls: ['./app-container.component.scss']
})
export class AppContainerComponent {

  constructor(
    private readonly logoutService: LogoutService
  ) { }

  public logout(): void {
    this.logoutService.logout();
  }
}
