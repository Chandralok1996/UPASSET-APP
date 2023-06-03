import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-filter',
  templateUrl: './filter.component.html',
  styleUrls: ['./filter.component.css']
})
export class FilterComponent implements OnInit {
  st:any;
  options:any;

  constructor(public dialogRef: MatDialogRef<FilterComponent>) { }

  ngOnInit(): void {
  }

  handleChange(){
   // this.getdata();
  }
  
  
  onNoClick() {
    this.dialogRef.close();
  }

  clearAll(){
    this.st=null;
  }

}
