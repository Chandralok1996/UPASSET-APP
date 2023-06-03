import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserAddFieldComponent } from './user-add-field.component';

describe('UserAddFieldComponent', () => {
  let component: UserAddFieldComponent;
  let fixture: ComponentFixture<UserAddFieldComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserAddFieldComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserAddFieldComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
