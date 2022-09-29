import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { tap } from 'rxjs';
import { LoginService } from 'src/app/services/login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {


  public loginFormGroup = new FormGroup({
    email: new FormControl<string>({ value: '', disabled: false }, Validators.required),
    password: new FormControl<string>({ value: '', disabled: false }, Validators.required)
  });

  constructor(
    private readonly loginService: LoginService,
    private readonly router: Router
  ) { }

  ngOnInit(): void {
  }

  public login(): void {
    this.loginService.login(this.loginFormGroup.value as any).pipe(
      tap(() => this.router.navigateByUrl('dashbaord'))
    ).subscribe();
  }
}
