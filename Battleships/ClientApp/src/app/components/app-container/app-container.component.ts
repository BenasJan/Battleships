import { Component, OnInit } from '@angular/core';
import { LogoutService } from 'src/app/services/logout.service';

@Component({
  selector: 'app-app-container',
  templateUrl: './app-container.component.html',
  styleUrls: ['./app-container.component.scss']
})
export class AppContainerComponent implements OnInit {

  constructor(
    private readonly logoutService: LogoutService
  ) { }

  ngOnInit(): void {
  }

  public logout(): void {
    this.logoutService.logout();
  }
}
