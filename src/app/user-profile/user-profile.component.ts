import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { UpdateUserComponent } from '../User_management/update-user/update-user.component';
import { AccountService } from '../_services/account.service';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {
  details: any;
  assetid: any;

  defaultpath='../../assets/img/';
  file = this.accountService.user.username+'.jpg';
  file1:any;


  constructor(public route:ActivatedRoute,
    public accountService: AccountService,
    private router: Router,
    public dialog: MatDialog
    ) { }

  ngOnInit(): void {

  
    this.route.paramMap.subscribe((params) => {
      this.assetid = params.get('id');
     this.getbyassetdetails1(this.assetid)
     console.log(this.assetid)
     //.then().catch(err => console.log(err));
   });
   this.start();
  }

  getbyassetdetails1(assetid:any){
    this.accountService.getbyuser(assetid)
        .subscribe(details => {
            this.details = details.rows;
            // this.file= this.details[0].firstname+' '+this.details[0].firstname+'.png';
            // console.log(this.file)
            console.log(this.details[0].user_id)
        });
  }

  
 
  start(){

   
      this.file1=this.defaultpath+this.file;
   
   
    console.log('stats',this.file1);
  }

 

  // routerPage(){
  //   console.log(this.accountService.user.rolename === 'Administrator');
    
  //   if(this.accountService.user.rolename === 'enduser'){
  //     this.router.navigate(['home/users/enduser']);

  //   }else if(this.accountService.user.rolename === 'Administrator'){
  //     this.router.navigate(['home/users/userlist']);
  //   }else if(this.accountService.user.rolename === 'HelpDesk'){
  //     this.router.navigate(['home/users/coordinator']);
  //   }else if(this.accountService.user.rolename === 'ITsupport'){
  //     this.router.navigate(['home/users/supuser']);
  //   }

  // }

  OpenUpdate(){
 
    this.router.navigate(['/home/users/updateuser',this.details[0].user_id])

  }

}
