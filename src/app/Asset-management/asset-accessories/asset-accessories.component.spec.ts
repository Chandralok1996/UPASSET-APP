import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetAccessoriesComponent } from './asset-accessories.component';

describe('AssetAccessoriesComponent', () => {
  let component: AssetAccessoriesComponent;
  let fixture: ComponentFixture<AssetAccessoriesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetAccessoriesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetAccessoriesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
