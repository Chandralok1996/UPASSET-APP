import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-new-user-role',
  templateUrl: './new-user-role.component.html',
  styleUrls: ['./new-user-role.component.css']
})
export class NewUserRoleComponent implements OnInit {

  constructor(public dialogRef: MatDialogRef<NewUserRoleComponent>) { }

  ngOnInit(): void {
  }
  onNoClick() {
    this.dialogRef.close();
  }

}
