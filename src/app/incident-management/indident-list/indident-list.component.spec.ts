import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { IndidentListComponent } from './indident-list.component';

describe('IndidentListComponent', () => {
  let component: IndidentListComponent;
  let fixture: ComponentFixture<IndidentListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ IndidentListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(IndidentListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
