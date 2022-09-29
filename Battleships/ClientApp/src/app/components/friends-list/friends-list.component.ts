import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-friends-list',
  templateUrl: './friends-list.component.html',
  styleUrls: ['./friends-list.component.scss']
})
export class FriendsListComponent implements OnInit {

  public friends = [
    {icon: 'person', name: 'Kajus Knoras', gamesPlayedCount: 10, gamesWonCount: 5 },
    {icon: 'person', name: 'Vladislav ryžovas', gamesPlayedCount: 2, gamesWonCount: 2 },
    {icon: 'person', name: 'Tomas Venslova', gamesPlayedCount: 3, gamesWonCount: 3 },
    {icon: 'person', name: 'Raminta Valaitytė', gamesPlayedCount: 5, gamesWonCount: 4 },
  ]

  constructor() { }

  ngOnInit(): void {
  }

}
