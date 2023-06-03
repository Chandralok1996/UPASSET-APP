import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssteDektopListComponent } from './asste-dektop-list.component';

describe('AssteDektopListComponent', () => {
  let component: AssteDektopListComponent;
  let fixture: ComponentFixture<AssteDektopListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssteDektopListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssteDektopListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
