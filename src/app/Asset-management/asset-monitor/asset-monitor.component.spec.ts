import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetMonitorComponent } from './asset-monitor.component';

describe('AssetMonitorComponent', () => {
  let component: AssetMonitorComponent;
  let fixture: ComponentFixture<AssetMonitorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetMonitorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetMonitorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
