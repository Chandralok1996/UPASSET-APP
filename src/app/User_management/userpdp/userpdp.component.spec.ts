import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserpdpComponent } from './userpdp.component';

describe('UserpdpComponent', () => {
  let component: UserpdpComponent;
  let fixture: ComponentFixture<UserpdpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserpdpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserpdpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
