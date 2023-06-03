import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InactiveFormComponent } from './inactive-form.component';

describe('InactiveFormComponent', () => {
  let component: InactiveFormComponent;
  let fixture: ComponentFixture<InactiveFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InactiveFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InactiveFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
