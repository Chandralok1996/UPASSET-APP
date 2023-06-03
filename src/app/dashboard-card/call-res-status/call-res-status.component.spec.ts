import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CallResStatusComponent } from './call-res-status.component';

describe('CallResStatusComponent', () => {
  let component: CallResStatusComponent;
  let fixture: ComponentFixture<CallResStatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CallResStatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CallResStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
