import { Component, OnInit } from '@angular/core';
import { AccountService } from '../_services/account.service';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmLogoutComponent } from '../confirm-logout/confirm-logout.component';



@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  async openConfirmationDialog() {
    
    const res = await this.openDialog(); 
    debugger;
    if (res) {
      this.logout();
    }
  
}


logout() {
  this.accountService.logout();
}

openDialog(): any {
  debugger;
  const dialogRef = this.dialog.open(ConfirmLogoutComponent, {
    width: '30%',
    data: { data: 'Are you sure to Logout ? '  },
    scrollStrategy: new NoopScrollStrategy(),
  });

  return new Promise((resolve, reject) => {
    dialogRef.afterClosed().subscribe(
      (res) => {
        resolve(res);
      },
      (error) => {
       (error);
        reject(error);
      }
    );
  });

}


  constructor(public accountService: AccountService, 
    public dialog: MatDialog,) { }

  ngOnInit(): void {
  }

}
