import { HttpClient } from '@angular/common/http';
import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from '../../_services/asset.service';

@Component({
  selector: 'app-update-server',
  templateUrl: './update-server.component.html',
  styleUrls: ['./update-server.component.css']
})
export class UpdateServerComponent implements OnInit {
  submitted = false;
  eightid:any;
  status: any;
  group: any;
  category: any;
  assetType: any;
  operartingSystem: any;
  servicePack: any;
  manufacture: any;
  processor: any;
  speed: any;
  form: FormGroup;
  loading = false;

filesToUpload: Array<File> = [];
  ramType: any;
  ramSize: any;
  hardType: any;
  capacity: any;
  gpuRam: any;
  card: any;
  optical: any;
  building: any;
  branch: any;
  floor: any;
  make: any;
  username: any;
  uname: any;
  vendor: any;
  vendorlocation: any;
 
 type= '';
 

  options: any;
  server: any;
  hardclass: any;
  ramslot: any;
  stgtype: any;
  rackno: any;
  nic: any;
  empid1: any;
  completName: any;
  asset: any;


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
     private modalService:NgbModal) { }
    

  ngOnInit(): void {

    this.dropdown();

    this.form = this.formBuilder.group({
    
      rtype:['',Validators.required],
      building: [''],
      make: ['', Validators.required],
      name: ['', Validators.required],
      assetno: ['', Validators.required],
      deptname: [''],
      eightid: [''],
      branch: [''],
      floor: [''],
      status: ['', Validators.required],
      astg_group: ['', Validators.required],
      category: ['', Validators.required],
      asset_type: ['', Validators.required],
      serialno: ['', Validators.required],
     productno:['',Validators.required],
      os: ['', Validators.required],
      sp: ['', Validators.required],
      model: ['', Validators.required],
      rsize: ['', Validators.required],
      purchase: ['', Validators.required],
      assigned: ['', Validators.required],
      expiry: ['', Validators.required],
      pon: [''],
      warranty: ['', Validators.required],
      vendor: [''],
      vloc: [''],
      mauth: [''],
      mexp: [''],
      file:[''],
      wsdate:[''],
      wedate:[''],
      storagetype:['',Validators.required],
      rackno:['', Validators.required],
      processor:['',Validators.required],
      ramslot:['',Validators.required],
      nic:['',Validators.required],
      hwclass:['',Validators.required],
      sertype:['',Validators.required],
      hostname:[''],
      bladeslot:['',Validators.required],
      empid:[''],
      mac:['',Validators.required],
      ip:['',Validators.required],
      managementip:['',Validators.required],
      disksize:['',Validators.required],
      ncorecard:['',Validators.required],
      ncorepercard:['',Validators.required],
      totcore:['',Validators.required],
      capacity:[''],
      fastno:[''],
      actionid:[this.accountservice.user.userid]

    });
    this.dropdown();

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

    this.assetService.getbyassetserverdetails(assetid)
    .subscribe(async (details) => {
         console.log('details'+details.rows)
          this.asset = details.rows[0];
          this.asset.name = this.asset.name+'/'+this.asset.empid;
          console.log( this.asset.name)
          this.userdet(this.asset.name);
          this.model(this.asset.make);
           this.getFloor(this.asset.building);
          this.ramtype(this.asset.rtype);
          this.os(this.asset.os);
         this.vendorname(this.asset.vendor)
          
  
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

    this.assetService.eightid().subscribe(data => {
      this.eightid = data.rows;
    }),
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
    this.assetService.serverOS().subscribe(data => {
      this.operartingSystem = data.rows;
     
    }),
    // this.assetService.servicePack().subscribe(data => {
    //   this.servicePack = data.rows;
    // }),
    this.assetService.serverMake().subscribe(data => {
      this.manufacture = data.rows;
    }),
    // this.assetService.processer().subscribe(data => {
    //   this.processor = data.rows;
    // }),
    this.assetService.serverram().subscribe(data => {
      this.ramType = data.rows;
      console.log('ramtype'+this.ramType)
    }),
    this.assetService.hardDisk().subscribe(data => {
      this.hardType = data.rows;
    }),
    this.assetService.gpuDisk().subscribe(data => {
      this.gpuRam = data.rows;
    }),
    this.assetService.optical().subscribe(data => {
      this.optical = data.rows;
    }),
    this.assetService.userName().subscribe(data => {
      this.username = data.rows;
      console.log(this.username)
    }),
    this.assetService.vendor().subscribe(data => {
      this.vendor = data.rows;
    }),
    this.assetService.servertype().subscribe(data => {
      this.server = data.rows;
    }),
    this.assetService.hardclass().subscribe(data => {
      this.hardclass = data.rows; 
    }),
    this.assetService.ramslot().subscribe(data => {
      this.ramslot = data.rows;
    }),
    this.assetService.storageType().subscribe(data => {
      this.stgtype = data.rows;
    }),
    this.assetService.rackno().subscribe(data => {
      this.rackno = data.rows;
    }),
    this.assetService.nic().subscribe(data => {
      this.nic = data.rows;
      
    }),
    this.assetService.processor().subscribe(data => {
      this.processor = data.rows;
     
    }),
    this.assetService.rackno().subscribe(data => {
      this.rackno = data.rows;
    })

  }

  getFloor(building){

    this.accountservice.floor(building)
        .subscribe(floor => {
            this.floor = floor.rows;
        });
  }

  getSpeed(){
    this.assetService.speed(this.form.value.processor)
    .subscribe(data => {
        this.speed = data.rows;
    });
  }
  ramtype(rtype){

    this.assetService.serverramSize(rtype)
    .subscribe(data => {
        this.ramSize = data.rows;
        console.log(this.ramSize)
       
    });
  }

  os(os){
    this.assetService.serverOSS(os)
    .subscribe(data => {
        this.servicePack = data.rows;
        console.log(this.ramSize)
       
    });
  }
  hardDisk(){
    this.assetService.capacity(this.form.value.hddtype)
    .subscribe(data => {
        this.capacity = data.rows;
    });

  }

  gpu(){
    this.assetService.gCard(this.form.value.gpucard)
    .subscribe(data => {
        this.card = data.rows;
    });

  }
  model(make){

    this.assetService.serverModel(make)
    .subscribe(data => {
        this.make = data.rows;
        console.log(this.make)
    });

  }

  userdet(item){
  
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

  vendorname(vendor){
    this.assetService.vendorloc(vendor)
    .subscribe(data => {
        this.vendorlocation = data.rows;
    });

  }

  onSubmit() {
    // this.form.value.assetno = this.form.value.assetno.trim();
    // this.form.value.astg_group = this.form.value.astg_group.trim();
    // this.form.value.serialno = this.form.value.serialno.trim();
    //  this.form.value.pon = this.form.value.pon.trim();
    // this.form.value.mauth = this.form.value.mauth.trim();
    //  this.form.value.pon = this.form.value.pon.trim();
    // this.form.value.fastno = this.form.value.fastno.trim();

    this.submitted = true;
    console.log(this.form.value.name);
   
    // reset alerts on submit
    this.alterservices.clear();
   
    this.form.value.name = this.empid1[0];
    this.form.value.empid = this.empid1[1];
    
   
  
    if(this.form.value.purchase !== null && (this.form.value.assigned === null || this.form.value.expiry === null)){
      return;
    }

    
if(this.form.value.warranty === 'valid' && (this.form.value.wsdate === null || this.form.value.wedate === null)){
  return;
}

    // stop here if form is invalid
    if (this.form.invalid) {
      // this.form.value.name = this.form.value.name+'/'+ this.form.value.empid;
       
      return;
    }
    this.loading = true;
    this.assetDesktop();

  }

  assetDesktop(){
    
    const formData: any = new FormData();
    const files: Array<File> = this.filesToUpload;
   

    for (let i = 0; i < files.length; i++) {

      formData.append("up", files[i], files[i]['name']);
    }
    formData.append("details", JSON.stringify(this.form.value))
 
    this.assetService.assetServerUpdate(formData)
      .subscribe(res => {
       // this.form.value.name = this.form.value.name+'/'+ this.form.value.empid;
       
        this.loading = false;
        console.log(res)

        if(res === 'Server Updated Succesfully')
        {
          this.router.navigate(['/home/users/assetserver']);
          this.alterservices.success('Server Updated Succesfully', {  autoClose: true, keepAfterRouteChange: true });       
 
         
        }
        if(res === 'Asset number OR Serial Number already exist'){
          this.alterservices.error(res, {  autoClose: true, keepAfterRouteChange: true });        
        
        }

        if(res.error){
          this.alterservices.success(res.error, { autoClose: true, keepAfterRouteChange: true });
  
         }
       
       
       // this.onNoClick();
        
      },
      error => {
        this.loading = false;
        this.alterservices.error(error, { autoClose: true, keepAfterRouteChange: true });       
 
      }

      )
   
       
  }

   
  keyword1='username';
  selectEvent(item){
    console.log(item)
  }
  onChangeSearch(val: string) {}
  
  onFocused(e){}

  

  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/assetserver']);
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  console.log('div App', e);
}

}






