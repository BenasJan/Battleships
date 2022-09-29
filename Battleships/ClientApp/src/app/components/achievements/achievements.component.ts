import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-achievements',
  templateUrl: './achievements.component.html',
  styleUrls: ['./achievements.component.scss']
})
export class AchievementsComponent implements OnInit {

  public achievements = [
    { icon: 'military_tech', name: 'First strike!', description: 'Fire a single bullet to a ship tile' },
    { icon: 'military_tech', name: 'Rookie', description: 'Play 100 games' },
    { icon: 'military_tech', name: 'Kyle', description: 'Play 1000 games' },
    { icon: 'military_tech', name: 'Disabler', description: 'Destory 100 enemy ship engines' },
    { icon: 'military_tech', name: 'Champion', description: 'Win 100 games' },
    { icon: 'military_tech', name: 'Pro champion', description: 'Win 1000 games' },
    { icon: 'military_tech', name: 'Ultimate champion', description: 'Win 10000 games' },
    { icon: 'military_tech', name: 'Veteran destructor', description: 'Destroy 1000 enemy ships' },
    { icon: 'military_tech', name: 'Karen', description: 'Block 5 players' }
  ]
  constructor() { }

  ngOnInit(): void {
  }

}
