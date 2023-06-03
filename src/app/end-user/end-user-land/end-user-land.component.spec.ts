import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EndUserLandComponent } from './end-user-land.component';

describe('EndUserLandComponent', () => {
  let component: EndUserLandComponent;
  let fixture: ComponentFixture<EndUserLandComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EndUserLandComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EndUserLandComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
