import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { tap } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { ToastService } from 'src/app/services/toast.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  public registrationFormGroup = new FormGroup({
    email: new FormControl<string>({ value: '', disabled: false }, Validators.required),
    password: new FormControl<string>({ value: '', disabled: false }, Validators.required)
  });

  constructor(
    private readonly authenticationService: AuthenticationService,
    private readonly toastService: ToastService,
    private readonly router: Router
  ) { }

  ngOnInit(): void {
  }

  public register(): void {
    this.authenticationService.register(this.registrationFormGroup.value as any).pipe(
      tap(() => this.toastService.publish('Registration successfull, please log in')),
      tap(() => this.router.navigateByUrl('login'))
    ).subscribe();
  }

}
