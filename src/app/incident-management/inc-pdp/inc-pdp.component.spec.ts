import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { IncPdpComponent } from './inc-pdp.component';

describe('IncPdpComponent', () => {
  let component: IncPdpComponent;
  let fixture: ComponentFixture<IncPdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ IncPdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(IncPdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
