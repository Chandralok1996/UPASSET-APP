import { HttpClient } from '@angular/common/http';
import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-update-monitor',
  templateUrl: './update-monitor.component.html',
  styleUrls: ['./update-monitor.component.css']
})
export class UpdateMonitorComponent implements OnInit {

  loading = false;
  submitted = false;
  form: any;
  filesToUpload: Array<File> = [];
  status: any;
  group: any;
  category: any;
  assetType: any;
  username: any;
  vendor: any;
  uname: any;
  vendorlocation: any;
  floor: any;
  monitor: any;
  type= '';
  asset:any;
  empid1: any;

  // design code


  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;


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
    public assetService: AssetService,
    private formBuilder: FormBuilder,
    public accountservice: AccountService,
    public alterservices: AlertService,
    private http: HttpClient,
    public route:ActivatedRoute,
    public router: Router,
    private modalService:NgbModal ) { }
   

  ngOnInit(): void {

    this.dropdown();
    this.form = this.formBuilder.group({
      pon: [''],
      warranty: ['', Validators.required],
      vendor: [''],
      vloc: [''],
      mauth: [''],
      mexp: [''],
      file:[''],
      name: ['', Validators.required],
      assetno: ['', Validators.required],
      deptname: [''],
      eightid: [''],
      branch: [''],
      floor: [''],
      building: [''],
      status: ['', Validators.required],
      astg_group: ['', Validators.required],
      category: ['', Validators.required],
      asset_type: ['', Validators.required],
      purchase: [''],
      assigned: [''],
      expiry: [''],
      serialno: ['', Validators.required],
      monitor: ['', Validators.required],
      description: ['', Validators.required],
      wsdate:[''],
      wedate:[''],
      empid:[''],
      fastno:[''],
      actionid:[this.accountservice.user.userid]
      

    });

    this.dropdown();
 
    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

    this.assetService.getbyassetdetailsMonitor(assetid)
    .subscribe(async (details) => {
        (details)
          this.asset = details.rows[0];
          this.asset.name = this.asset.name+'/'+this.asset.empid;
          this.userdet(this.asset.name);
          
  
          setTimeout(() => {
            this.form.patchValue(this.asset);
          }, 400);    
           
    });

  });


  }

  fileChangeEvent(fileInput: any) {
    this.filesToUpload = <Array<File>>fileInput.target.files;
  }


  get f() { return this.form.controls; }

  dropdown(){
    this.assetService.status().subscribe(data => {
      this.status = data.rows;
    }),
    this.assetService.group().subscribe(data => {
      this.group = data.rows;
    }),
    this.assetService.category().subscribe(data => {
      this.category = data.rows;
    }),
    this.assetService.assetType().subscribe(data => {
      this.assetType = data.rows;
    }),
    this.assetService.userName().subscribe(data => {
      this.username = data.rows;
     
    }),
    this.assetService.vendor().subscribe(data => {
      this.vendor = data.rows;
    }),
    this.assetService.monitor().subscribe(data => {
      this.monitor = data.rows;
     (this.monitor)
     
    })
  }

  userdet(item:any){
    // this.empid1 = username.split('/');
    // username = this.empid1[0];

    // this.assetService.userdet(username)
    // .subscribe(data => {
    //     this.uname = data.rows;
    // });
    if(item.username){
      let username = item.username;
      this.empid1 = username.split('/');
      this.assetService.userdet(this.empid1[0])
      .subscribe(data => {
          this.uname = data.rows;
      });
  
    }else{
      this.empid1 = item.split('/');
      this.assetService.userdet(this.empid1[0])
      .subscribe(data => {
          this.uname = data.rows;
      });
  
    }

  }

 

  getFloor(building:any){

    this.accountservice.floor(building)
        .subscribe(floor => {
            this.floor = floor.rows;
        });
  }


  onSubmit() {
  //   this.form.value.assetno = this.form.value.assetno.trim();
  //  this.form.value.astg_group = this.form.value.astg_group.trim();
  //  this.form.value.serialno = this.form.value.serialno.trim();
  //   this.form.value.pon = this.form.value.pon.trim();
  //  this.form.value.mauth = this.form.value.mauth.trim();
  //   this.form.value.pon = this.form.value.pon.trim();
  //  this.form.value.fastno = this.form.value.fastno;
    
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

   
    this.form.value.name = this.empid1[0];
    this.form.value.empid = this.empid1[1];
(this.form.value);

 if(this.form.value.purchase !== null && (this.form.value.assigned === null || this.form.value.expiry === null)){
  return;
}


if(this.form.value.warranty === 'valid' && (this.form.value.wsdate === null || this.form.value.wedate === null)){
  return;
}
 

    // stop here if form is invalid
    if (this.form.invalid) {
      
      return;
    }
    this.loading = true;
    this.assetMonitorUpdate();

  }

  assetMonitorUpdate(){
   (this.form.value)
    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
    //(files);

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }

    formData.append("details", JSON.stringify(this.form.value))

    this.assetService.assetMonitorUpdate(formData)
      .subscribe(res => {
       
        
        this.loading = false;
       (res);
        if(res === 'Asset Updated Successfully')
        {
          this.router.navigate(['/home/users/assetmonitor']);
          this.alterservices.success('Asset Monitor Updated Succesfully', {  autoClose: false, keepAfterRouteChange: true });
         
        }
        if(res === 'Asset number OR Serial Number already exist'){
          
          this.alterservices.error('Asset number OR Serial Number already exist', { autoClose: false, keepAfterRouteChange: true });
       
        }
        if(res.error){
          this.alterservices.success(res.error, { autoClose: true, keepAfterRouteChange: true });
  
         }
       
     
        
      },
      error => {
        this.loading = false;
        this.alterservices.error(error, { autoClose: false, keepAfterRouteChange: true });
       
      }

      )
    
      

  }
  
  keyword1='username';
  selectEvent(item:any){
   (item)
  }
  onChangeSearch(val: string) {}
  
  onFocused(e:any){}

  

  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/assetmonitor']);
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e:any) {
 //('window', e);
}

 

divScroll(e:any) {

}
 

}

