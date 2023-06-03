import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { KnowlManagementComponent } from './knowl-management.component';

describe('KnowlManagementComponent', () => {
  let component: KnowlManagementComponent;
  let fixture: ComponentFixture<KnowlManagementComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ KnowlManagementComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(KnowlManagementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
