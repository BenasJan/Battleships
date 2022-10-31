import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthorizedRouteGuard } from './authorized-route.guard';
import { AchievementsComponent } from './components/achievements/achievements.component';
import { AppContainerComponent } from './components/app-container/app-container.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { FriendsListComponent } from './components/friends-list/friends-list.component';
import { GameLobbyComponent } from './components/game-lobby/game-lobby.component';
import { GameSessionComponent } from './components/game-session/game-session.component';
import { InventoryComponent } from './components/inventory/inventory.component';
import { LoginComponent } from './components/login/login.component';
import { ProfileComponent } from './components/profile/profile.component';
import { PublicGamesListComponent } from './components/public-games-list/public-games-list.component';
import { CreateGameSessionComponent } from './components/create-game-session/create-game-session.component';
import { PublicUsersListComponent } from './components/public-users-list/public-users-list.component';
import { RegisterComponent } from './components/register/register.component';
import { NotificationComponent } from './components/notification/notification.component';
import { UnauthorizedRouteGuard } from './unauthorized-route.guard';

const routes: Routes = [
  // { path: '', redirectTo: 'login'},
  { path: 'login', component: LoginComponent, canActivate: [UnauthorizedRouteGuard] },
  { path: 'register', component: RegisterComponent, canActivate: [UnauthorizedRouteGuard] },
  { path: '', component: AppContainerComponent, children: [
      { path: 'dashboard', component: DashboardComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'inventory', component: InventoryComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'achievements', component: AchievementsComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'games', component: PublicGamesListComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'createGame', component: CreateGameSessionComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'battle', component: GameSessionComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'players', component: PublicUsersListComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'profile', component: ProfileComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'friends', component: FriendsListComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'lobby/:id', component: GameLobbyComponent, canActivate: [AuthorizedRouteGuard] },
      { path: 'gameplay/:id', component: GameSessionComponent, canActivate: [AuthorizedRouteGuard] } 
    { path: 'lobby/:id', component: GameLobbyComponent, canActivate: [AuthorizedRouteGuard] },
    { path: 'notifications', component: NotificationComponent, canActivate: [AuthorizedRouteGuard] },

    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
