import { TestBed } from '@angular/core/testing';

import { MoveSubmissionService } from './move-submission.service';

describe('MoveSubmissionService', () => {
  let service: MoveSubmissionService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MoveSubmissionService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
