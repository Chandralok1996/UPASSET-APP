import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DesktopPdfComponent } from './desktop-pdf.component';

describe('DesktopPdfComponent', () => {
  let component: DesktopPdfComponent;
  let fixture: ComponentFixture<DesktopPdfComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DesktopPdfComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DesktopPdfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
