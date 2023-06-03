import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserGrpComponent } from './user-grp.component';

describe('UserGrpComponent', () => {
  let component: UserGrpComponent;
  let fixture: ComponentFixture<UserGrpComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserGrpComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserGrpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
