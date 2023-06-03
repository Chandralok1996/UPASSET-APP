import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UsergrpPdpComponent } from './usergrp-pdp.component';

describe('UsergrpPdpComponent', () => {
  let component: UsergrpPdpComponent;
  let fixture: ComponentFixture<UsergrpPdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UsergrpPdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UsergrpPdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
