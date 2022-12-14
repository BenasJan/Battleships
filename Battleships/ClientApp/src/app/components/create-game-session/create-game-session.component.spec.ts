import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateGameSessionComponent } from './create-game-session.component';

describe('CreateGameSessionComponent', () => {
  let component: CreateGameSessionComponent;
  let fixture: ComponentFixture<CreateGameSessionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateGameSessionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CreateGameSessionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
