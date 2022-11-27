import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-notifications',
  templateUrl: './notification.component.html',
})
export class NotificationComponent implements OnInit {



  public notifications = [
    { icon: 'emoji_events', title: 'You\'ve earned an achievement', text: 'First Win', from:'', type:'achievement' },
    { icon: 'person_add_alt_1', title: '', text: 'Sent you a friend request', from:'User1', type:'request' },
    { icon: 'newspaper', title: 'New Update!', text: 'Added 5 new cosmetic skins', from:'', type:'news' },
    { icon: 'expand_less', title: 'Rank up', text: 'You\'ve reached rank [Private]', from:'', type:'info' }
  ]

  ngOnInit(): void {
    console.log(this.notifications)
  }
}

