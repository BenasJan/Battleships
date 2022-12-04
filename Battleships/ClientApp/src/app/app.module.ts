import { CdkColumnDef } from "@angular/cdk/table";
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatButtonToggleModule } from "@angular/material/button-toggle";
import { MatCardModule } from '@angular/material/card';
import { MatDialogModule } from '@angular/material/dialog';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatSelectModule } from "@angular/material/select";
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableModule } from "@angular/material/table";
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTooltipModule } from '@angular/material/tooltip';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthorizeInterceptor } from "./authorize.interceptor";
import { AchievementsComponent } from './components/achievements/achievements.component';
import { AppContainerComponent } from './components/app-container/app-container.component';
import { CreateGameSessionComponent } from './components/create-game-session/create-game-session.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { FriendsListComponent } from './components/friends-list/friends-list.component';
import { GameLobbyComponent } from './components/game-lobby/game-lobby.component';
import { GameSessionComponent } from './components/game-session/game-session.component';
import { InventoryComponent } from './components/inventory/inventory.component';
import { LoginComponent } from './components/login/login.component';
import { NotificationComponent } from './components/notification/notification.component';
import { ProfileComponent } from './components/profile/profile.component';
import { PublicGamesListComponent } from './components/public-games-list/public-games-list.component';
import { PublicUsersListComponent } from './components/public-users-list/public-users-list.component';
import { RegisterComponent } from './components/register/register.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    DashboardComponent,
    AchievementsComponent,
    GameLobbyComponent,
    GameSessionComponent,
    AppContainerComponent,
    InventoryComponent,
    PublicGamesListComponent,
    PublicUsersListComponent,
    ProfileComponent,
    FriendsListComponent,
    RegisterComponent,
    CreateGameSessionComponent,
    NotificationComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatCardModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule,
    MatTooltipModule,
    MatListModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatSelectModule,
    MatButtonToggleModule,
    MatTableModule,
    MatGridListModule,
    MatDialogModule
  ],
  providers: [CdkColumnDef,{
    provide: HTTP_INTERCEPTORS, useClass: AuthorizeInterceptor, multi: true },
    MatSnackBar],
  bootstrap: [AppComponent]
})
export class AppModule { }
