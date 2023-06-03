import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetAccessoriesListComponent } from './asset-accessories-list.component';

describe('AssetAccessoriesListComponent', () => {
  let component: AssetAccessoriesListComponent;
  let fixture: ComponentFixture<AssetAccessoriesListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssetAccessoriesListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssetAccessoriesListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
