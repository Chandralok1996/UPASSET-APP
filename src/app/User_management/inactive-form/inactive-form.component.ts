import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-inactive-form',
  templateUrl: './inactive-form.component.html',
  styleUrls: ['./inactive-form.component.css']
})
export class InactiveFormComponent implements OnInit {

  form: FormGroup;
  submitted = false;
  department: any;
  tabledata: any;
  tempArr : [] =[];
  assteData: any;
  previousData :any = []; 
  status: any;
  loading = false;

  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
 


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
    private formBuilder: FormBuilder, 
    public alterservices: AlertService,
    public accountservice: AccountService,
    public assetservice: AssetService,
    private router: Router,
    private modalService:NgbModal,
    private route:ActivatedRoute
   ) { }
   

  ngOnInit(): void {
   
    this.dropdown();

     this.form = this.formBuilder.group({
       loginname: [''],
       firstname: ['', Validators.required],
      empid: ['', Validators.required],
      eightid: ['', Validators.required],
      department: ['', Validators.required],
      email: ['', Validators.required],
      branch: ['', Validators.required],
      empasset:['', Validators.required],
     // name:[''],
      owaaccess:['', Validators.required],
      sapid:[''],
      user_id: [''],
      asts: ['', Validators.required],
      usercg: [''],
      leftdate: ['', Validators.required],
      bkreq: ['', Validators.required],
      rmad: ['', Validators.required],
      rmsmtp: ['', Validators.required],
      rmsmtpdate:['', Validators.required]

     });

     this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

    this.accountservice.getbyuser(assetid)
    .subscribe(async (details) => {
         console.log(details)
         if(details){
          let asset = await details.rows[0];
          asset.reportingto = asset.reportingto+'/'+asset.repempid;
            this.form.patchValue(asset);
            setTimeout(() => {
              this.form.patchValue({
                department: asset.department
              }); 
            }, 500);             
         }         
    });


    this.assetservice.assetforperticularuser(assetid).subscribe(data => {
      
      this.tabledata = data.rows;

      this.tabledata = this.tabledata.map(item => ({ data: `${item.assetno}` }));
        for (const iterator of this.tabledata) {
          this.previousData.push(iterator.data)
        } 
      this.assteData =  this.previousData 
      this.form.patchValue({
        empasset:this.assteData
      });  

    });
  })

  }

  get f() { return this.form.controls; }

  dropdown() {
    this.accountservice.department().subscribe(data => {
      this.department = data.rows;
    }),
    this.assetservice.status().subscribe(data => {
      this.status = data.rows;
    })
  }

 


  
  onSubmit() {
    debugger;
      this.submitted = true;
 
     // reset alerts on submit
     this.alterservices.clear();
 console.log(this.form.value)
    //  this.empid1 = this.form.value.reportingto.split('/');
    //  this.form.value.reportingto = this.empid1[0];
    //  this.form.value.repempid = this.empid1[1];
 
     // stop here if form is invalid
     if (this.form.invalid) {
      // this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
       return;
     }
 
     this.loading = true;
     this.createUser();
 
   }
 
   createUser() {
     console.log(this.form);
 
     this.accountservice.inactiveUser(this.form.value)
       .subscribe(res => {
         //this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
         //console.log(res[0].Status);
         this.loading = false;
         console.log(res);
       
        if(res.Status === 'User Inactivated Successfully!!'){
          this.router.navigate(['/home/users/leftemplist'])
        
          this.alterservices.success(res.Status, {autoClose:true, keepAfterRouteChange: true });
         
        }else if(res.message){
         this.alterservices.success(res.message, {autoClose:true, keepAfterRouteChange: true });
         
        }
      else if(res.error){
         this.alterservices.error(res.error, {autoClose:true, keepAfterRouteChange: true });
        
        }
       
       
       },
         error => {
          
           this.alterservices.error(error);
          
         }
       );
      // this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
       
 
   }

   
  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/userlist']);
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
 // console.log('div App', e);
}

 
 
}
