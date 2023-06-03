import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteServerComponent } from './asste-server.component';

describe('AssteServerComponent', () => {
  let component: AssteServerComponent;
  let fixture: ComponentFixture<AssteServerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteServerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteServerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
