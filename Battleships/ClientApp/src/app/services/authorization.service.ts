import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthorizationService {

  private readonly JwtTokenKey = 'JWT_TOKEN';

  private readonly jwtTokenSubject = new BehaviorSubject<string | null>(null);

  constructor() { }

  public intializeAuthorization(): void {
    const existingToken = localStorage.getItem(this.JwtTokenKey);

    if (existingToken) {
      this.registerToken(existingToken);
    }
  }

  public registerToken(token: string): void {
    localStorage.setItem(this.JwtTokenKey, token);

    this.jwtTokenSubject.next(token);
  }

  public clearToken(): void {
    localStorage.removeItem(this.JwtTokenKey);

    this.jwtTokenSubject.next(null);
  }

  public get isAuthorized(): boolean {
    return !!this.jwtTokenSubject.value;
  }

  public get jwtToken(): string | null {
    return this.jwtTokenSubject.value;
  }
}
