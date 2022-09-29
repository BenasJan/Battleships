import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PublicUsersListComponent } from './public-users-list.component';

describe('PublicUsersListComponent', () => {
  let component: PublicUsersListComponent;
  let fixture: ComponentFixture<PublicUsersListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PublicUsersListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PublicUsersListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
