import { array } from '@amcharts/amcharts4/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Component, ElementRef, HostListener, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { AlertService } from '../_services';
import { AccountService } from '../_services/account.service';
import { IncidentService } from '../_services/incident.service';

import { Location } from '@angular/common'

@Component({
  selector: 'app-update-ticket',
  templateUrl: './update-ticket.component.html',
  styleUrls: ['./update-ticket.component.css'],
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
export class UpdateTicketComponent implements OnInit {
  @ViewChild('exampleModal', { static: true }) exampleModalRef!: ElementRef;
  @ViewChild('closeButton') closeButton:any;


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
  asset: any;
  affectproduct: any;
  asset1 : any;

  c: any;
  b1:any;
  note1: any;
  note2: any;
  prioritystatus: any;
  empid1: any;
  empid2: any;
  previousData :any = []; 
  asset2: any;
  inid1: any;
  keyword1='username';
  short: any;
  createdby: any;

  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;
  assigneWarning: boolean = false;
  resMode: any;


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
    public route:ActivatedRoute, 
    private router: Router,
    private location: Location,
    private modalService:NgbModal) { }
   

  ngOnInit(): void {
  
    this.userName = this.accountService.user.userid;
   (this.userName);

    if( this.accountService.user.vipstatus === 'General'){
      this.prioritystatus = 'High';
     
    }
    else if(this.accountService.user.vipstatus === 'VIP'){
      this.prioritystatus = 'Very High';
    }
   
    this. dropdown();
    this.form = this.formBuilder.group({

      issue_desc: ['', Validators.required],
      username:[''],
      contact:[''],
      affectedpro:['', Validators.required],
      priority:['',  Validators.required],
      serialno:[''],
      openedby:['', Validators.required],
      assignedto:['', Validators.required],
      status:['',Validators.required],
      notes:['', Validators.required],
      detaii_desc:['', Validators.required],
      email:[''],
      file:[''],
      inid_id:[''],
      inre_id:[''],
      created:[''],
      details1:[''],
      working_notes:[''],
      openedbyempid:[''],
      assignedtoempid:[''],
      actionid:[this.accountService.user.userid],
      inrmid:[''],
      callmode:[''],
      resolution:[''],
      organization:['', Validators.required]


    });

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
    this.incidentservice.incidentgetbyid(assetid)
    .subscribe(async (details) => {
        (details)
          this.asset = details.rows;
          this.asset.openedby = this.asset.openedby+'/'+this.asset.openedbyempid;
          this.asset.assignedto = this.asset.assignedto+'/'+this.asset.assignedtoempid;
          this.asset1 =details.rows1;
          this.asset2 = details.rows3;
       
        this.asset1 = this.asset1.map((item:any) => ({ data: `\n${item.created} - ${item.working_notes}` }));
        for (const iterator of this.asset1) {
          this.previousData.push(iterator.data)
        } 
        (this.asset)
        

          (this.asset.assignedto)
          this.assignedto(this.asset.affectedpro);

          if(this.asset.status === 'Assigned'){
            if(this.asset.assignedto === 'null/null'){
              this.assigneWarning = true;
            }
          }
 
          setTimeout(  () => {
          
            this.form.patchValue(this.asset);
           this.form.patchValue({
             working_notes : this.previousData});
             this.form.patchValue({
              email: this.asset2[0].email});
              if(this.form.value.status !== 'New'){
                this.form.patchValue({
                  inrmid: this.asset.responsemode
                });
              }
              if(this.asset.assignedto === 'null/null'){
                this.form.patchValue({
                 assignedto: ''
                })
               }

          }, 400);  

    
    });

  });
 
  }

  dropdown(){

    this.incidentservice.assetName(this.userName)
    .subscribe(data => {
        this.aproduct = data.rows;
    }),
   
    this.incidentservice.getstatus()
    .subscribe(data => {
        this.status = data.rows;
    }),
    this.incidentservice.getpriority().subscribe(data => {
      this.priority = data.rows;
      
    }),
    this.incidentservice.getresmode().subscribe(data => {
      this.resMode = data.rows;
     ( this.resMode)
    })
   

  }

  assignedto(affectedpro:any){
   (affectedpro)
    this.incidentservice.assignedto(affectedpro)
    .subscribe(data => {
        this.assigned = data.rows;
       (this.assigned);
    })
  }

  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }

  
 

  get f() { return this.form.controls; }

  onSubmit(){
    if(this.form.value.status !== 'New' && (this.form.value.resmode === '')){
      return;
    }

    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    
    for(let i=0; i<this.resMode.length; i++){
      if(this.form.value.inrmid === this.resMode[i].responsemode){
        this.form.value.inrmid = this.resMode[i].inrm_id;
       (this.form.value.resmode)
    }
    }
    
   (this.form.value);
    debugger;
    if(this.form.value.assignedto.username){
      this.empid1 = this.form.value.assignedto.username.split('/');
      this.form.value.assignedto = this.empid1[0];
      this.form.value.assignedtoempid = this.empid1[1];
    }else{
      this.empid1 = this.form.value.assignedto.split('/');
      this.form.value.assignedto = this.empid1[0];
      this.form.value.assignedtoempid = this.empid1[1];
    }
   

    this.empid2 = this.form.value.openedby.split('/');
    this.form.value.openedby = this.empid2[0];
    this.form.value.openedbyempid = this.empid2[1];

    //(this.form.value.inid_id)
    // this.inid1 = this.form.value.inid_id.split('-');
    // this.form.value.inid_id = this.inid1[1];
    

   ('name '+ this.form.value.assignedtoempid + this.form.value.assignedto + this.form.value.inid_id);
   ('openby '+ this.form.value.openedby +  this.form.value.openedbyempid);


    // stop here if form is invalid
    if (this.form.invalid) {
      this.form.value.openedby = this.empid2[0] +'/'+this.empid2[1]
      this.form.value.assigned = this.empid1[0]+'/'+this.empid1[1];
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

    this.incidentservice.updateIncident(formData).subscribe(res => {
      this.form.value.openedby = this.empid2[0] +'/'+this.empid2[1]
      this.form.value.assigned = this.empid1[0]+'/'+this.empid1[1];
     (res);

      if(res.Status){

       
            this.router.navigate(['/home/users/incpdp',this.form.value.inid_id]);
         

        this.alterservices.success('Incident Updated successfully', {autoClose: true, keepAfterRouteChange: true });  
      }
      else{
        this.alterservices.success(res, {autoClose: true, keepAfterRouteChange: true });  
  
      }
    
    },
      error => {
        this.loading = false;
        this.alterservices.error(error, {autoClose: true, keepAfterRouteChange: true });
       
      },

      
      
    );
      this.form.value.openedby = this.empid2[0] +'/'+this.empid2[1]
      this.form.value.assigned = this.empid1[0]+'/'+this.empid1[1];

  }

  selectEvent(item:any) {
   
    this.empid1 = item.username;
   (this.empid1)
  }

  onChangeSearch(val: string) {}
  
  onFocused(e:any){}


  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
    // if(this.accountService.user.rolename === 'ITsupport'){
    //   this.router.navigate(['/home/users/supuser']);
    // }else if(this.accountService.user.rolename === 'Helpdesk'){
    //   this.router.navigate(['/home/users/coordinator']);
    // }else if(this.accountService.user.rolename === 'Administrator'){
    //   this.router.navigate(['/home/users/incident']);
    // }
    this.location.back()
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e:any) {
 //('window', e);
}

 

divScroll(e:any) {
 //('div App', e);
}

}

