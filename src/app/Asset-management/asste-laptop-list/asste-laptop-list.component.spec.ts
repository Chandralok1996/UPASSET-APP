import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteLaptopListComponent } from './asste-laptop-list.component';

describe('AssteLaptopListComponent', () => {
  let component: AssteLaptopListComponent;
  let fixture: ComponentFixture<AssteLaptopListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteLaptopListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteLaptopListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
