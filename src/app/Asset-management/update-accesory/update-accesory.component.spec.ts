import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateAccesoryComponent } from './update-accesory.component';

describe('UpdateAccesoryComponent', () => {
  let component: UpdateAccesoryComponent;
  let fixture: ComponentFixture<UpdateAccesoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UpdateAccesoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdateAccesoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
