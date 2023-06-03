import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RejoinFormComponent } from './rejoin-form.component';

describe('RejoinFormComponent', () => {
  let component: RejoinFormComponent;
  let fixture: ComponentFixture<RejoinFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RejoinFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RejoinFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
