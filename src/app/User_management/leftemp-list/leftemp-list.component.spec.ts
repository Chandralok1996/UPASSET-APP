import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeftempListComponent } from './leftemp-list.component';

describe('LeftempListComponent', () => {
  let component: LeftempListComponent;
  let fixture: ComponentFixture<LeftempListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeftempListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeftempListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
