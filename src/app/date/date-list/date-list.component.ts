import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-date-list',
  templateUrl: './date-list.component.html',
  styleUrls: ['./date-list.component.css']
})
export class DateListComponent implements OnInit {

  form: any;
  constructor( private formBuilder: FormBuilder,) { }

  ngOnInit(): void {

   
  }


}
