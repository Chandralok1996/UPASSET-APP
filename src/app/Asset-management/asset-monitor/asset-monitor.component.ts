import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from 'src/app/_services/asset.service';
import { AddFieldComponent } from '../add-field/add-field.component';

@Component({
  selector: 'app-asset-monitor',
  templateUrl: './asset-monitor.component.html',
  styleUrls: ['./asset-monitor.component.css']
})
export class AssetMonitorComponent implements OnInit {

  
  @ViewChild('exampleModal', { static: true }) exampleModalRef: ElementRef;
  @ViewChild('closeButton') closeButton;

  loading = false;
  submitted = false;
  form: FormGroup;
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
  empid1: any;
  keyword1='username';

  // design variable

  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  assetResultSerial: any;
  assetResult: any;

  
  constructor(
    public assetService: AssetService,
    private formBuilder: FormBuilder,
    public accountservice: AccountService,
    public alterservices: AlertService,
    private http: HttpClient,
    public dialog: MatDialog ,
    private router: Router,
    private modalService:NgbModal) { }
    
  ngOnInit(): void {

    this.dropdown();
    this.form = this.formBuilder.group({
      pon: [''],
      warranty: ['', Validators.required],
      vendor: ['', Validators.required],
      vloc: ['', Validators.required],
      mauth: ['', Validators.required],
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
      astg_group: ['MONITOR', Validators.required],
      category: ['HARDWARE', Validators.required],
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
      console.log(this.monitor)
     
    })



  }

  userdet(item){
    let name = item.username
    this.empid1 = name.split('/');
   
    this.assetService.userdet(this.empid1[0])
    .subscribe(data => {
        this.uname = data.rows;
    });

  }

  vendorname(vendor){
    this.assetService.vendorloc(vendor)
    .subscribe(data => {
        this.vendorlocation = data.rows;
    });

  }

  getFloor(){

    this.accountservice.floor(this.form.value.building)
        .subscribe(floor => {
            this.floor = floor.rows;
        });
  }


  onSubmit() {
    this.form.value.assetno = this.form.value.assetno.trim();
   this.form.value.astg_group = this.form.value.astg_group.trim();
   this.form.value.serialno = this.form.value.serialno.trim();
    this.form.value.pon = this.form.value.pon.trim();
   this.form.value.mauth = this.form.value.mauth.trim();
    this.form.value.pon = this.form.value.pon.trim();
   this.form.value.fastno = this.form.value.fastno.trim();
    
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

  //  this.empid1 = this.form.value.name.split('/');
    this.form.value.name = this.empid1[0];
    this.form.value.empid = this.empid1[1];
    console.log(this.form.value)

    if(this.form.value.purchase !== '' && (this.form.value.assigned === '' || this.form.value.expiry === '')){
      return;
    }

    if(this.form.value.warranty === 'valid' && (this.form.value.wsdate === '' || this.form.value.wedate === '')){
      return;
    }

    // stop here if form is invalid
    if (this.form.invalid) {
     // this.form.value.name = this.form.value.name+'/'+ this.form.value.empid;
      return;
    }
    this.loading = true;
   
    this.assetMonitor();

  }

  assetMonitor(){
    console.log(this.form.value)
    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
    // console.log(files);

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }

    formData.append("details", JSON.stringify(this.form.value))

    this.assetService.assetMonitorInsert(formData)
      .subscribe(res => {
       // this.form.value.name = this.form.value.name+'/'+ this.form.value.empid;
       
        this.loading = false;
        console.log(res);
        if(res === 'Asset Monitor Created Succesfully')
        {
          this.router.navigate(['/home/users/assetmonitor']);
          this.alterservices.success('Asset Monitor Created Succesfully', {  autoClose: false, keepAfterRouteChange: true });
        
         
        }
        if(res === 'Asset number OR Serial Number already exist'){
          this.alterservices.error('Asset number OR Serial Number already exist', {  autoClose: false, keepAfterRouteChange: true });
        
        }
        if(res.error){
          this.alterservices.success(res.error, { autoClose: true, keepAfterRouteChange: true });
  
         }
       
       // this.onNoClick();
        
      },
      error => {
        this.loading = false;
        this.alterservices.error(error, {  autoClose: true, keepAfterRouteChange: true });
        
      }

      )
      this.form.value.name = this.form.value.name+'/'+ this.form.value.empid;
      

  }

  
  addField(item){
  
    const dialogRef = this.dialog.open(AddFieldComponent, {
      width: 'auto',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      data : {data:item}
    });

    dialogRef.afterClosed().subscribe(result => {
      if(item === 'vendor'){
        this.assetService.vendor().subscribe(data => {
          this.vendor = data.rows;
        })
      }
      else if(item === 'vendorl'){
        this.assetService.vendorloc(this.form.value.vendor)
        .subscribe(data => {
            this.vendorlocation = data.rows;
        })
      }
      console.log('The dialog was closed');
    });


  }

  osystem(item){
    // this.osys = os;
    if(item === 'ADD NEW OS' ){
      document.getElementById('exampleModal').click();
    }
    else if(item === 'ADD NEW Vendor'){
      document.getElementById('exampleModal2').click();
    }
    else if(item === 'ADD NEW SP'){
      document.getElementById('exampleModal1').click();
    }
    else if(item === 'ADD NEW Location'){
      document.getElementById('exampleModal3').click();
    }
    else if(item === 'ADD NEW Make'){
      document.getElementById('exampleModal4').click();
    }
    else if(item === 'ADD NEW Model'){
      document.getElementById('exampleModal5').click();
    }
    else if(item === 'ADD NEW Processor'){
      document.getElementById('exampleModal6').click();
    }
    else if(item === 'ADD NEW Speed'){
      document.getElementById('exampleModal7').click();
    }
    else if(item === 'ADD NEW Ram Type'){
      document.getElementById('exampleModal8').click();
    }
    else if(item === 'ADD NEW Ram Size'){
      document.getElementById('exampleModal9').click();
    }
    else if(item === 'ADD NEW HDD Type'){
      document.getElementById('exampleModal10').click();
    }
    else if(item === 'ADD NEW Capacity'){
      document.getElementById('exampleModal11').click();
    }
    else if(item === 'ADD NEW GPU Card'){
      document.getElementById('exampleModal12').click();
    }
    else if(item === 'ADD NEW Capacity'){
      document.getElementById('exampleModal11').click();
    }
  
   
    console.log(item);
  }

  selectEvent(item) {
    console.log(item)
    this.empid1 = item.username;
  }

  onChangeSearch(val: string) {}
  
  onFocused(e){}


  
  close(){
    this.router.navigate(['/home/users/assetaccessories']);
}
  


openVerticallyCentered(content:any) {
  this.modalService.open(content, { centered: true });
}


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


divScroll(e) {
  console.log('div App', e);
}

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}



onPercentChange(assetno){
 
  this.assetService.validateAssetno(assetno).subscribe(
    data => {
      console.log(data.Status);
      if(data.Status === "Asset with this name Already exists!!!"){
            this.assetResult = data.Status;
      }else{
        this.assetResult=''
        console.log(data.Status)
      }

    }
  )

}

onSerialnum(serialnum){
  console.log(serialnum);
  this.assetService.validateSerialNum(this.form.value.astg_group,serialnum).subscribe(
    data => {
      console.log(data.Status);
      if(data.Status === "Asset with this serial number Already exists!!!"){
            this.assetResultSerial = data.Status;
      }else{
        this.assetResultSerial=''
        console.log(data.Status)
      }

    }
  )
}


}
