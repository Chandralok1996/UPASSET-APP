import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

export interface DialogData {
  data: string;
  use: string;
}

@Component({
  selector: 'app-confirm-logout',
  templateUrl: './confirm-logout.component.html',
  styleUrls: ['./confirm-logout.component.css']
})

export class ConfirmLogoutComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<ConfirmLogoutComponent>,
    @Inject(MAT_DIALOG_DATA) public dialogData: DialogData  ) { }

    close(): void {
      this.dialogRef.close();
     }

  

  ngOnInit(): void {
  }

}
