import { TestBed } from '@angular/core/testing';

import { FriendsConnectionService } from './friends-connection.service';

describe('FriendsConnectionService', () => {
  let service: FriendsConnectionService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FriendsConnectionService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
