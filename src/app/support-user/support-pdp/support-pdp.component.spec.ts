import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SupportPdpComponent } from './support-pdp.component';

describe('SupportPdpComponent', () => {
  let component: SupportPdpComponent;
  let fixture: ComponentFixture<SupportPdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SupportPdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SupportPdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
