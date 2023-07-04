import { Component, OnInit, Input, HostListener } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AccountService } from '../_services/account.service';
import { AssetService } from '../_services/asset.service';
import { IncidentService } from '../_services/incident.service';
@Component({
  selector: 'app-sort',
  templateUrl: './sort.component.html',
  styleUrls: ['./sort.component.css']
})
export class SortComponent implements OnInit {
st:any;

dateTime:any;
options:any;
products:any;
products1:any;
products2:any;
products3:any;

@Input() enduser={
  status:'',
  date1:'',
  priority:'',
  sgname:'',
  assignedto:'',
  openedby:'',
  empid:''
};

dropdownList = [];
dropdownSettings = {};
  
  priorityDropdownList = [];
  priorityDropdownSettings = {};

  assignedDropdownList :any = [];
  assignedDropdownSettings = {};

  supportDropdownList = [];
  supportDropdownSettings = {};
  username: any;
  userName: any;
  user_id: any;
  empid1:any;

  constructor( public assetService: AssetService,
    public accountService: AccountService,
     public incidentservice: IncidentService,private router: Router, public dialogRef: MatDialogRef<SortComponent>) { }
     @HostListener('window:keyup.esc') onKeyUp() {
      this.dialogRef.close();
    }
  ngOnInit(): void {
    this.user_id = this.accountService.user.userid;
    this.getdata();
  }

   getdata(){
    this.incidentservice.sortpriority().subscribe((data: any[])=>{
      this.products = JSON.stringify(data);
      this.products = JSON.parse(this.products)
      this.priorityDropdownList = this.products.rows;
    }),
    this.incidentservice.sortStatus().subscribe((data: any[])=>{
     
      this.products1 = JSON.stringify(data);
      this.products1 = JSON.parse(this.products1);
      this.dropdownList =  this.products1.rows;
     (this.dropdownList)
     
      
   }),
  this.incidentservice.sortAssignedto(this.user_id).subscribe((data: any[])=>{
   
    this.products2 = JSON.stringify(data);
    this.products2 = JSON.parse(this.products2);
    this.assignedDropdownList=this.products2.rows;
 
  }),
  this.incidentservice.sortsupgrp().subscribe((data: any[])=>{
   
    this.products3 = JSON.stringify(data);
    this.products3 = JSON.parse(this.products3);
    this.supportDropdownList=this.products3.rows;
   
  }),
  this.assetService.userName().subscribe(data => {
    this.username = data.rows;
  }),

  this.dropdownSettings = {
    singleSelection: false,
    idField: 'inst_id',
    textField: 'status',
    selectAllText: 'Select All',
    unSelectAllText: 'UnSelect All',
    itemsShowLimit: 3,
    allowSearchFilter: true
  };

  this.priorityDropdownSettings = {
    singleSelection: false,
    idField: 'inpr_id',
    textField: 'priority',
    selectAllText: 'Select All',
    unSelectAllText: 'UnSelect All',
    itemsShowLimit: 3,
    allowSearchFilter: true
  }

  this.supportDropdownSettings = {
    singleSelection: false,
    idField: 'ussg_id',
    textField: 'sgname',
    selectAllText: 'Select All',
    unSelectAllText: 'UnSelect All',
    itemsShowLimit: 3,
    allowSearchFilter: true
  }
 
}

onItemSelect(item: any) {
 (item);
  
}
onSelectAll(items: any) {
  
 (items[0].status);
}
handleChange(){
  this.getdata();
}


onNoClick() {
  this.dialogRef.close();
}
onChange($event:any){
 (this.dateTime);
}
clearAll(){
  this.st=null;
}


submit(){
if(this.enduser.assignedto){
  this.empid1 = this.enduser.assignedto.split('/');
  this.enduser.assignedto = this.empid1[0];
  this.enduser.empid = this.empid1[1];
 ('assignedto '+ this.enduser.empid + this.enduser.assignedto);
}else if(this.enduser.openedby){
  this.empid1 = this.enduser.openedby.split('/');
  this.enduser.openedby = this.empid1[0];
  this.enduser.empid = this.empid1[1];
 ('openby '+ this.enduser.empid + this.enduser.openedby);

}
  
 
  this.incidentservice.enduser = this.enduser;
 (this.incidentservice.enduser);
 
        this.onNoClick();
     this.router.navigate(["/home/users/report"]); 
}


}

