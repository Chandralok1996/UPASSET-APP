import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EngineerCallComponent } from './engineer-call.component';

describe('EngineerCallComponent', () => {
  let component: EngineerCallComponent;
  let fixture: ComponentFixture<EngineerCallComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EngineerCallComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EngineerCallComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
