import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteLaptopComponent } from './asste-laptop.component';

describe('AssteLaptopComponent', () => {
  let component: AssteLaptopComponent;
  let fixture: ComponentFixture<AssteLaptopComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteLaptopComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteLaptopComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
