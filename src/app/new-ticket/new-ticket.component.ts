import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from '../_services';
import { AccountService } from '../_services/account.service';
import { IncidentService } from '../_services/incident.service';

@Component({
  selector: 'app-new-ticket',
  templateUrl: './new-ticket.component.html',
  styleUrls: ['./new-ticket.component.css']
})
export class NewTicketComponent implements OnInit {
  type: any;
  options: any;
  type1: any;
  options1: any;
  userName: any;
  aproduct: any;
  priority: any;
  status: any;
  form: any;
  loading = false;
  submitted = false;
  assigned: any;
  filesToUpload: Array<File> = [];
  userid: any;
  prioritystatus: any;
  shortdec: any;
  incidenttype: any;
  prlength: any;

  //design

  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;
  createdby:any;
  short: any;


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



  constructor(  private router: Router,
    private modalService:NgbModal,
    public accountService: AccountService,
    public incidentservice: IncidentService,
    private formBuilder: FormBuilder,
    public alterservices: AlertService,) { }
    

  ngOnInit(): void {
    debugger;
    this.userName = this.accountService.user.username;
    this.userid = this.accountService.user.userid;
    

   (this.userName);
    this.dropdown();

    if( this.accountService.user.vipstatus === 'General'){
      this.prioritystatus = 'Medium';
     
    }
    else if(this.accountService.user.vipstatus === 'VIP'){
      this.prioritystatus = 'High';
    }

    this.form = this.formBuilder.group({
      intp: ['', Validators.required],
      issue_desc: ['', Validators.required],
      username:[''],
      contact:[''],
      affectedpro:['', Validators.required],
      priority:[this.prioritystatus,  Validators.required],
      serialno:[''],
      openedby:[this.accountService.user.username, Validators.required],
     // assignedto:['', Validators.required],
      status:['New',Validators.required],
     // notes:['', Validators.required],
      detaildesc:['', Validators.required],
      email:[''],
      file:[''],
      empid:[this.accountService.user.empid],
      vipstatus:[this.accountService.user.vipstatus, Validators.required],
      rolename:[this.accountService.user.rolename],
      actionid:[this.accountService.user.userid],
      callmode:['Web', Validators.required],
      orgid:[this.accountService.user.orgdet.org]

    });

   

    
  }

  dropdown(){

    this.incidentservice.assetName(this.userid)
    .subscribe(data => {
        this.aproduct = data.rows;
       (this.aproduct)
        this.prlength = this.aproduct.length
       
    }),
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
    this.incidentservice.inctype().subscribe(data => {
      this.incidenttype = data.rows;
      
    })

  }

  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }

 
  get f() { return this.form.controls; }

  onSubmit(){
    this.form.value.empid = this.form.value.empid.trim();
    this.form.value.openedby = this.form.value.openedby.trim();
    this.form.value.callmode = '102'
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }
    this.loading = true;
    this.createIncident();

  }

  createIncident(){

    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
    (this.form.value);

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }

    formData.append("details", JSON.stringify(this.form.value))
    this.loading = false;

    this.incidentservice.newIncident(formData)
    .subscribe(res => {
     (res);

      if(res.Status === 'Incident created Successfully!!!'){
        this.router.navigate(['/home/users/enduser']);
        this.alterservices.success('Incident Created successfully', { autoClose: true, keepAfterRouteChange: true });
      
      }
      
      if(res.error){
        this.alterservices.success(res.error, { autoClose: true, keepAfterRouteChange: true });


       }
     
    },
      error => {
        this.loading = false;
        this.alterservices.error(error, { autoClose: true, keepAfterRouteChange: true });
       
      }
    );



  }

  inctype(event:any){
    const inpt = event.target ? (event.target as HTMLInputElement).value : event;
    this.incidentservice.incshort(inpt)
    .subscribe(data => {
      this.shortdec = data.rows; 
     
    })

  }
  
  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/enduser']);
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e:any) {
 //('window', e);
}

 

divScroll(e:any) {
 //('div App', e);
}
}
