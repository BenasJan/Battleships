import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { tap } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent {


  public loginFormGroup = new FormGroup({
    email: new FormControl<string>({ value: '', disabled: false }, Validators.required),
    password: new FormControl<string>({ value: '', disabled: false }, Validators.required)
  });

  constructor(
    private readonly loginService: AuthenticationService,
    private readonly router: Router
  ) { }

  public login(): void {
    this.loginService.login(this.loginFormGroup.value as any).pipe(
      tap(() => this.router.navigateByUrl('/dashboard'))
    ).subscribe();
  }
}
