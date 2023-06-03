import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ItlistComponent } from './itlist.component';

describe('ItlistComponent', () => {
  let component: ItlistComponent;
  let fixture: ComponentFixture<ItlistComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ItlistComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ItlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
