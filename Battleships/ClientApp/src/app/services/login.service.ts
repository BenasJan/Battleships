import { Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { AuthorizationService } from './authorization.service';
import { HttpService } from './http.service';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(
    private httpService: HttpService,
    private authorizationService: AuthorizationService
  ) { }

  public login(login: { email: string, password: string }): Observable<{ token: string }> {
    return this.httpService.post<{ token: string }>('Authentication', 'login', login).pipe(
      tap(response => this.authorizationService.registerToken(response.token))
    );
  }
}
