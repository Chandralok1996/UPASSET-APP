import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateDesktopComponent } from './update-desktop.component';

describe('UpdateDesktopComponent', () => {
  let component: UpdateDesktopComponent;
  let fixture: ComponentFixture<UpdateDesktopComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UpdateDesktopComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdateDesktopComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
