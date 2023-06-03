import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Component, ElementRef, HostListener, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AlertService } from '../_services';
import { AccountService } from '../_services/account.service';
import { AssetService } from '../_services/asset.service';
import { IncidentService } from '../_services/incident.service';

@Component({
  selector: 'app-new-ticket-user',
  templateUrl: './new-ticket-user.component.html',
  styleUrls: ['./new-ticket-user.component.css'],
  encapsulation: ViewEncapsulation.None,
  styles: [`
     .modal-content {
      background-color: white;
      color: black;
      margin-top:40%;
      border-radius:13px;
    }
    `]
})
export class NewTicketUserComponent implements OnInit {
  type: any;
  options: any;
  type1: any;
  options1: any;
  userName: any;
  aproduct: any;
  priority: any;
  status: any;
  form: FormGroup;
  loading = false;
  submitted = false;
  assigned: any;
  filesToUpload: Array<File> = [];
  userid: string;
  prioritystatus: any;
  username1: any;
  
  empid1: any;
  keyword='assetno';
  empid2: any;
  astno: any;
  name1: any;
  vip: any;

  
  keyword1='username';
  incidenttype: any;
  shortdec: any;
  prlength: any;
  result: any;

  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;
  createdby:any;
  short: any;
  calmode: any;
  products8: any;


  setActiveClass1() {
    this.statusClass = "active";
    this.statusClasses = "not-active";
    this.statusClassess = "not-active";

  }

  setActiveClass2() {
    this.statusClasses = "active";
    this.statusClass = "not-active";
    this.statusClassess = "not-active";

  }
  setActiveClass3() {
    this.statusClass = "not-active";
    this.statusClasses = "not-active";
    this.statusClassess = "active";
  }



  constructor( 
    public accountService: AccountService,
    public incidentservice: IncidentService,
    private formBuilder: FormBuilder,
    public alterservices: AlertService,
    public assetService: AssetService,
    public accountservice:AccountService,
    private router: Router,
    private modalService:NgbModal) { }


  ngOnInit(): void {
   
    this.userName = this.accountService.user.username;
    this.userid = this.accountService.user.userid;

    
    this. dropdown();

   

    this.form = this.formBuilder.group({
      intp: ['', Validators.required],
      issue_desc: ['', Validators.required],
      username:[''],
      affectedpro:[''],
      priority:['',  Validators.required],
      serialno:[''],
      openedby:['', Validators.required],
      // assignedto:['', Validators.required],
      status:['New',Validators.required],
      // notes:['', Validators.required],
      detaildesc:['', Validators.required],
      callmode:['', Validators.required],
      email:[''],
      file:[''],
      group:[''],
      vipstatus:[this.accountService.user.vipstatus, Validators.required],
      empid:[''],
      astoempid:[''],
      rolename:[this.accountService.user.rolename],
      contactnum:[''],
      contact:[''],
      actionid:[this.accountservice.user.userid],
      designationname:[''],
      dept:[''],
      eightid:[''],
      orgid:['', Validators.required]


    });

    setTimeout(() => {
      this.form.patchValue({
        orgid: this.accountService.user.orgdet.org
      })
    }, 1000);
  
    
  }

  dropdown(){

    // this.incidentservice.assetName(this.userid)
    // .subscribe(data => {
    //     this.aproduct = data.rows;
    //     console.log(this.aproduct)
    // }),
    this.incidentservice.getpriority()
    .subscribe(data => {
        this.priority = data.rows;
    }),
    this.incidentservice.getstatus()
    .subscribe(data => {
        this.status = data.rows;
    }),
    this.incidentservice.assignedto(this.userName)
    .subscribe(data => {
        this.assigned = data.rows;
    }),
    this.assetService.userName().subscribe(data => {
      this.username1 = data.rows;
    }),
    this.incidentservice.inctype().subscribe(data => {
      this.incidenttype = data.rows;
      
    }),
    this.incidentservice.getpriority().subscribe(data => {
      this.priority = data.rows;
      
    }),
    this.incidentservice.callMode().subscribe(data => {
      this.calmode = data.rows;
      console.log(this.calmode)
    }),
    this.accountservice.organization().subscribe(data => {
      this.products8 = data.rows;
      console.log(this.products8)
    })

  }

  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }

 

  get f() { return this.form.controls; }

  onSubmit(){
    debugger;
    this.alterservices.clear();

    this.submitted = true;

    if( (this.form.value.intp === 'INCIDENT' || this.form.value.intp === 'REQUEST') && (this.form.value.group === '' || this.form.value.affectedpro === '')){
      return;
    }

    console.log(this.form.value.callmode)
    for(let i=0; i<this.calmode.length; i++){
      if(this.form.value.callmode === this.calmode[i].callmode){
        this.form.value.callmode = this.calmode[i].incm_id;
        console.log(this.form.value.callmode)
    }
    }

    let orgid = this.products8.filter(orgname =>{
      if(orgname.org === this.form.value.orgid){
           return orgname
      }
      else{

      }
    });
    console.log(orgid);

    this.form.value.orgid = orgid[0].uscorg_id;
    console.log(this.form.value.orgid)
    // reset alerts on submit
   

   // this.empid1 = this.name1.split('/');
    this.form.value.openedby = this.name1[0];
    this.form.value.empid = this.name1[1];

    this.empid2 = this.form.value.affectedpro.split('/');
    this.form.value.affectedpro = this.empid2[0];
    this.form.value.astoempid = this.empid2[1];
   
    console.log('name '+this.form.value.empid + this.form.value.openedby);
 
    this.form.value.empid = this.form.value.empid.trim();
    this.form.value.openedby = this.form.value.openedby.trim();
   this.form.value.affectedpro = this.form.value.affectedpro.trim();

   

   

    console.log(this.form.value)
  

    // stop here if form is invalid
    if (this.form.invalid) {
      this.form.value.affectedpro = this.empid2[0]+'/'+ this.empid2[1];
      this.form.value.orgid = this.accountService.user.orgdet.org;
      return;
    }
    this.loading = true;
   
    
    console.log('name '+this.form.value.empid + this.form.value.openedby);

   

    this.createIncident();

  }

  createIncident(){

    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
     console.log(this.form.value);

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }

    formData.append("details", JSON.stringify(this.form.value))
    this.loading = false;

    this.incidentservice.newIncident(formData)
    .subscribe(res => {
      this.form.value.affectedpro = this.empid2[0]+'/'+ this.empid2[1];

      console.log(res);
        if(res.Status === 'Incident created Successfully!!!'){
          if(this.accountService.user.rolename === 'ITsupport'){
            this.router.navigate(['/home/users/supuser']);
          }else if(this.accountService.user.rolename === 'Helpdesk'){
            this.router.navigate(['/home/users/coordinator']);
          }else if(this.accountService.user.rolename === 'Administrator'){
            this.router.navigate(['/home/users/incident']);
          }

         // this.onNoClick();
      this.alterservices.success('Incident Created successfully', { autoClose: true, keepAfterRouteChange: true });
     
      }
      else if(res.message){
        this.result = res.message;
        this.form.value.orgid = this.accountService.user.orgdet.org;
        this.alterservices.error(res.message, { autoClose: true, keepAfterRouteChange: true });
     
      }
     else if(res.error){
      this.form.value.orgid = this.accountService.user.orgdet.org;
        this.alterservices.success(res.error, { autoClose: true, keepAfterRouteChange: true });
            
      }
    },
      error => {
        this.loading = false;
        this.form.value.orgid = this.accountService.user.orgdet.org;
        this.alterservices.error(error, { autoClose: true, keepAfterRouteChange: true });
       
      }
    );

    this.form.value.affectedpro = this.empid2[0]+'/'+ this.empid2[1];


  }

  asset(astgrp){
  //  astgrp = astgrp.trim(); ,this.form.value.intp
    console.log(astgrp, this.name1[1])
    this.incidentservice.assetGroup(astgrp,this.name1[1])
    .subscribe(data => {
      this.aproduct = data.rows;
      this.prlength = this.aproduct.lengt;
      console.log(data.rows)
     
    })
  }

  userdet(name){
   // name = name.trim();
    console.log(name)
    this.form.patchValue({
      contactnum : name.contactnum
    });
    this.name1 = name.username.split('/');
    name = this.name1[0];
    console.log(name)
    this.assetService.userdet(name)
    .subscribe(data => {
        this.vip = data.rows;
        console.log(this.vip);
        
        if(this.vip[0].vipstatus === 'General'){
         
           this.form.patchValue({
             priority: 'High'});
          
        }else if(this.vip[0].vipstatus === 'VIP'){
          this.form.patchValue({
            priority: 'Very High'});
         
        }
        this.form.patchValue({
          designationname:this.vip[0].designationname,
          eightid:this.vip[0].eightid,
          dept:this.vip[0].deptname
        })
    });

  }

  selectEvent(item) {
    this.astno = item.assetno;
    // do something with selected item
  }

  onChangeSearch(val: string) {
    // fetch remote data from here
    // And reassign the 'data' which is binded to 'data' property.
  }
  
  onFocused(e){
    // do something when input is focused
  }

  inctype(inpt){
    this.incidentservice.incshort(inpt)
    .subscribe(data => {
      this.shortdec = data.rows; 
     
    })

  }

  // onFocused(e){}



  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
    if(this.accountService.user.rolename === 'ITsupport'){
      this.router.navigate(['/home/users/supuser']);
    }else if(this.accountService.user.rolename === 'Helpdesk'){
      this.router.navigate(['/home/users/coordinator']);
    }else if(this.accountService.user.rolename === 'Administrator'){
      this.router.navigate(['/home/users/incident']);
    }
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
 // console.log('div App', e);
}

}
