import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';

@Injectable({
  providedIn: 'root'
})
export class ToastService {

  constructor(
    private readonly matSnackBar: MatSnackBar
  ) { }

  public publish(message: string): void {
    this.matSnackBar.open(message, 'Ok', { duration: 3000 });
  }
}
