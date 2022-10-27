import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import jwt_decode from "jwt-decode";

@Injectable({
  providedIn: 'root'
})
export class AuthorizationService {

  private readonly JwtTokenKey = 'JWT_TOKEN';

  private readonly jwtTokenSubject = new BehaviorSubject<string>('');

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

    this.jwtTokenSubject.next('');
  }

  public get isAuthorized(): boolean {
    return !!this.jwtTokenSubject.value;
  }

  public get jwtToken(): string {
    return this.jwtTokenSubject.value;
  }

  public getUserId(): string {
    const token = jwt_decode(this.jwtToken) as any;
    const userId = token.USER_ID;

    return userId;
  }
}
