import { TestBed } from '@angular/core/testing';

import { GameSessionEventsService } from './game-session-events.service';

describe('GameSessionEventsService', () => {
  let service: GameSessionEventsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(GameSessionEventsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
