import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NewTicketUserComponent } from './new-ticket-user.component';

describe('NewTicketUserComponent', () => {
  let component: NewTicketUserComponent;
  let fixture: ComponentFixture<NewTicketUserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NewTicketUserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NewTicketUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
