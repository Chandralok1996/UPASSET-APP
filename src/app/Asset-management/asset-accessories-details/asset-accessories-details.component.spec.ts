import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetAccessoriesDetailsComponent } from './asset-accessories-details.component';

describe('AssetAccessoriesDetailsComponent', () => {
  let component: AssetAccessoriesDetailsComponent;
  let fixture: ComponentFixture<AssetAccessoriesDetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetAccessoriesDetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetAccessoriesDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
