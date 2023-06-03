import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteDektopComponent } from './asste-dektop.component';

describe('AssteDektopComponent', () => {
  let component: AssteDektopComponent;
  let fixture: ComponentFixture<AssteDektopComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteDektopComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteDektopComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
