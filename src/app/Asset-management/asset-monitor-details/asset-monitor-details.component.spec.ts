import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetMonitorDetailsComponent } from './asset-monitor-details.component';

describe('AssetMonitorDetailsComponent', () => {
  let component: AssetMonitorDetailsComponent;
  let fixture: ComponentFixture<AssetMonitorDetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetMonitorDetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetMonitorDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
