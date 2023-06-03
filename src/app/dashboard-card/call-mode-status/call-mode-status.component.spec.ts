import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CallModeStatusComponent } from './call-mode-status.component';

describe('CallModeStatusComponent', () => {
  let component: CallModeStatusComponent;
  let fixture: ComponentFixture<CallModeStatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CallModeStatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CallModeStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
