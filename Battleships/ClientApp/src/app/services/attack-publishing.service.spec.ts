import { TestBed } from '@angular/core/testing';

import { AttackPublishingService } from './attack-publishing.service';

describe('AttackPublishingService', () => {
  let service: AttackPublishingService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AttackPublishingService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
