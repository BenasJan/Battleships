import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-public-users-list',
  templateUrl: './public-users-list.component.html',
  styleUrls: ['./public-users-list.component.scss']
})
export class PublicUsersListComponent implements OnInit {

  public users = [
    {icon: 'person', name: 'Benas Janušonis', gamesPlayedCount: 20, gamesWonCount: 10 },
    {icon: 'person', name: 'Kajus Knoras', gamesPlayedCount: 10, gamesWonCount: 5 },
    {icon: 'person', name: 'Vladislav ryžovas', gamesPlayedCount: 2, gamesWonCount: 2 },
    {icon: 'person', name: 'Deividas Ambrozaitis', gamesPlayedCount: 8, gamesWonCount: 8 },
    {icon: 'person', name: 'Eligijus Anilionis', gamesPlayedCount: 4, gamesWonCount: 3 },
    {icon: 'person', name: 'Vaida Vasiliauskaite', gamesPlayedCount: 4, gamesWonCount: 2 },
    {icon: 'person', name: 'Tomas Venslova', gamesPlayedCount: 3, gamesWonCount: 3 },
    {icon: 'person', name: 'Raminta Valaitytė', gamesPlayedCount: 5, gamesWonCount: 4 },
  ]
  constructor() { }

  ngOnInit(): void {
  }

}
