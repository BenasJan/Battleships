import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
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
import { PublicUsersListComponent } from './components/public-users-list/public-users-list.component';

const routes: Routes = [
  // { path: '', redirectTo: 'login'},
  { path: 'login', component: LoginComponent },
  { path: '', component: AppContainerComponent, children: [
      { path: 'dashboard', component: DashboardComponent },
      { path: 'inventory', component: InventoryComponent },
      { path: 'achievements', component: AchievementsComponent },
      { path: 'games', component: PublicGamesListComponent },
      { path: 'lobby', component: GameLobbyComponent },
      { path: 'battle', component: GameSessionComponent },
      { path: 'players', component: PublicUsersListComponent },
      { path: 'profile', component: ProfileComponent },
      { path: 'friends', component: FriendsListComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
