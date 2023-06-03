import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteServerListComponent } from './asste-server-list.component';

describe('AssteServerListComponent', () => {
  let component: AssteServerListComponent;
  let fixture: ComponentFixture<AssteServerListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteServerListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteServerListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
