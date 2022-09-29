import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AuthorizationService } from './authorization.service';

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
    this.router.navigateByUrl('/login');
  }
}
