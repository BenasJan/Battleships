import { TestBed } from '@angular/core/testing';

import { MoveSubmissionEventsService } from './move-submission.service';

describe('MoveSubmissionService', () => {
  let service: MoveSubmissionEventsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MoveSubmissionEventsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
