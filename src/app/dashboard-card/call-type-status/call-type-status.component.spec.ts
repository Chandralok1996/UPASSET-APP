import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CallTypeStatusComponent } from './call-type-status.component';

describe('CallTypeStatusComponent', () => {
  let component: CallTypeStatusComponent;
  let fixture: ComponentFixture<CallTypeStatusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CallTypeStatusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CallTypeStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
