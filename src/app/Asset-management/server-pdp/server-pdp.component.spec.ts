import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ServerPdpComponent } from './server-pdp.component';

describe('ServerPdpComponent', () => {
  let component: ServerPdpComponent;
  let fixture: ComponentFixture<ServerPdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ServerPdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ServerPdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
