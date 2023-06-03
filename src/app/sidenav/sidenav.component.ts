import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, HostListener, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ConfirmLogoutComponent } from '../confirm-logout/confirm-logout.component';
import { User } from '../_models';
import { AccountService } from '../_services/account.service';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.css']
})
export class SidenavComponent implements OnInit {
  
  public admin:boolean = false;
  public asset:boolean = false;
  date1: string;
  collapsed=true;
  user: User;
  tokenName: any;

  defaultpath='../../assets/img/';
file=this.accountService.user.username+'.jpg'
file1:any;
  open: boolean;
  itemManagement: any;
  hardManagement: boolean;
  dashboardManagement: any;
  openhistory: any;
  op: boolean;

  constructor(public accountService: AccountService, public router:Router,
    public dialog: MatDialog,) {
   
   // this.accountService.user.subscribe(x => this.user = x);
}

  ngOnInit(): void {    
    this.start();
    this.tokenName =localStorage.getItem("user");
    console.log(this.accountService.user.username)
  }
 
   


start(){
  this.file1=this.defaultpath+this.file;
  console.log('stats',this.file1);
  }

  async openConfirmationDialog() {
    
    const res = await this.openDialog();
    debugger;
    if (res) {
      this.logout();
    }
  
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
        console.log(error);
        reject(error);
      }
    );
  });

}
  routePath(){
    this.router.navigate(['/user']);
  }

  logout() {
    this.accountService.logout();
}

openArr(){
  this.op = !this.op;
  }

openArrow(){
this.open = !this.open;
}


openArrowHistory(){
  this.openhistory = !this.openhistory;
  }

itemMang(){
this.itemManagement = !this.itemManagement
}


// dashboardMang(){
//   this.dashboardManagement = !this.dashboardManagement
//   }

  public show:boolean = false;
  public buttonName:any = 'Show';
  public show1:boolean = false;
  public buttonName1:any = 'Show';
  public show2:boolean = false;
  public buttonName2:any = 'Show';
  public show3:boolean = false;
  public buttonName3:any = 'Show';
  public show4:boolean = false;
  public buttonName4:any = 'Show';
  // public show5:boolean = false;
  // public buttonName5:any = 'Show';
  // public show6:boolean = false;
  // public buttonName6:any = 'Show';

toggle() {
  this.show = !this.show;

  // CHANGE THE NAME OF THE BUTTON.
  if(this.show)  
    this.buttonName = "Hide";
  else
    this.buttonName = "Show";
}


toggle1() {
  this.show1 = !this.show1;

  // CHANGE THE NAME OF THE BUTTON.
  if(this.show1)  
    this.buttonName1 = "Hide";
  else
    this.buttonName1 = "Show";
}



toggle2() {
  this.show2 = !this.show2;

  // CHANGE THE NAME OF THE BUTTON.
  if(this.show2)  
    this.buttonName2 = "Hide";
  else
    this.buttonName2 = "Show";
}



toggle3() {
  this.show3 = !this.show3;

  // CHANGE THE NAME OF THE BUTTON.
  if(this.show3)  
    this.buttonName3 = "Hide";
  else
    this.buttonName3 = "Show";
}




toggle4() {
  this.show4 = !this.show4;

  // CHANGE THE NAME OF THE BUTTON.
  if(this.show4)  
    this.buttonName4 = "Hide";
  else
    this.buttonName4 = "Show";
}


// toggle5() {
//   this.show5 = !this.show5;
//   if(this.show5)  
//     this.buttonName5 = "Hide";
//   else
//     this.buttonName5 = "Show";
// }

@HostListener('window:scroll', ['$event'])
onScroll(e) {
  // console.log('window', e);
}

divScroll(e) {
  //console.log('div App', e);
}


hardMang(){
  this.hardManagement = !this.hardManagement
}

// toggleHard(){
//   this.show6 = !this.show6;

  
//   if(this.show6)  
//     this.buttonName6 = "Hide";
//   else
//     this.buttonName6 = "Show";
// }


}

