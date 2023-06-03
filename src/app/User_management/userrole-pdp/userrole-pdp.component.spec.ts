import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserrolePdpComponent } from './userrole-pdp.component';

describe('UserrolePdpComponent', () => {
  let component: UserrolePdpComponent;
  let fixture: ComponentFixture<UserrolePdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserrolePdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserrolePdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
