import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetDesktopDetailsComponent } from './asset-desktop-details.component';

describe('AssetDesktopDetailsComponent', () => {
  let component: AssetDesktopDetailsComponent;
  let fixture: ComponentFixture<AssetDesktopDetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetDesktopDetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetDesktopDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
