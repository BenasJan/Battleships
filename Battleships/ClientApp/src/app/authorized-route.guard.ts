import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthorizationService } from './services/authorization.service';

@Injectable({
  providedIn: 'root'
})
export class AuthorizedRouteGuard implements CanActivate {
  
  constructor(
    private authorizationService: AuthorizationService,
    private router: Router
  ) { }
  
  public canActivate(_next: ActivatedRouteSnapshot, _state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
    const isAuthorized = this.authorizationService.isAuthorized;

    if (!isAuthorized) {
      this.router.navigateByUrl('/login');
      return false;
    }

    return true;
  }
}
