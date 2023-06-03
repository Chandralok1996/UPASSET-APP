import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AccPdfComponent } from './acc-pdf.component';

describe('AccPdfComponent', () => {
  let component: AccPdfComponent;
  let fixture: ComponentFixture<AccPdfComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AccPdfComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AccPdfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
