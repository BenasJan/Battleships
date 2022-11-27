import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.component.html'
})
export class InventoryComponent implements OnInit {

  public mapSkins = [
    { icon: 'zoom_out_map', location: 'Belgrad', name: 'Navy', gamesPlayed: '0', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Berlin', name: 'Navy', gamesPlayed: '0', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Berlin', name: 'Navy', gamesPlayed: '0', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Riga', name: 'Navy', gamesPlayed: '8', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Carribean islands', name: 'Crimson', gamesPlayed: '6', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Baltic sea', name: 'Crimson', gamesPlayed: '8', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Jungle', name: 'Crimson', gamesPlayed: '10', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Volcano', name: 'Crimson', gamesPlayed: '12', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Washington', name: 'Crimson', gamesPlayed: '0', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Tunnel', name: 'Crimson', gamesPlayed: '0', lastPlayed: '2022-09-15' },
    { icon: 'zoom_out_map', location: 'Washington', name: 'Gold', gamesPlayed: '0', lastPlayed: '2022-09-15' },
  ];

  public shipSkins = [
    { icon: 'sailing', shipName: 'Carrier', name: 'Navy', gamesPlayed: '1', lastPlayed: '2022-09-15' },
    { icon: 'sailing', shipName: 'Battleship', name: 'Navy', gamesPlayed: '2', lastPlayed: '2022-09-15' },
    { icon: 'sailing', shipName: 'Cruiser', name: 'Navy', gamesPlayed: '3', lastPlayed: '2022-09-15' },
    { icon: 'sailing', shipName: 'Submarine', name: 'Navy', gamesPlayed: '12', lastPlayed: '2022-09-15' },
    { icon: 'sailing', shipName: 'Destroyer', name: 'Navy', gamesPlayed: '10', lastPlayed: '2022-09-15' },
    { icon: 'sailing', shipName: 'Carrier', name: 'Crimson', gamesPlayed: '12', lastPlayed: '2022-09-10' },
    { icon: 'sailing', shipName: 'Cruiser', name: 'Crimson', gamesPlayed: '10', lastPlayed: '2022-09-10' },
    { icon: 'sailing', shipName: 'Submarine', name: 'Crimson', gamesPlayed: '8', lastPlayed: '2022-09-10' },
    { icon: 'sailing', shipName: 'Destroyer', name: 'Crimson', gamesPlayed: '10', lastPlayed: '2022-09-10' },
    { icon: 'sailing', shipName: 'Carrier', name: 'Limited edition', gamesPlayed: '10', lastPlayed: '2022-09-10' }
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
