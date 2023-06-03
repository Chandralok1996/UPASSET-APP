import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DasboardReportComponent } from './dasboard-report.component';

describe('DasboardReportComponent', () => {
  let component: DasboardReportComponent;
  let fixture: ComponentFixture<DasboardReportComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DasboardReportComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DasboardReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
