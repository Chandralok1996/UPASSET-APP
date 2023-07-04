import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { first } from 'rxjs/operators';
import { AlertService } from 'src/app/_services';
import { AccountService } from '../../_services/account.service';
import { UserAddFieldComponent } from '../user-add-field/user-add-field.component';

@Component({
  selector: 'app-rejoin-form',
  templateUrl: './rejoin-form.component.html',
  styleUrls: ['./rejoin-form.component.css']
})
export class RejoinFormComponent implements OnInit {
  @ViewChild('exampleModal', { static: true }) exampleModalRef!: ElementRef;
  @ViewChild('closeButton') closeButton:any;
  public buttonName: any = 'Show';
  public sys: boolean = false;
  public contact: boolean = false;
  loading = false;
  form: any;
  submitted = false;


  products7:any;
  products8 :any = [];
  products9 :any = [];
  products10 :any = [];
  products11 :any = [];
  usergrp :any = [];
  role :any = [];
  designation :any = [];
  department :any = [];
  floor :any = [];
  usertype :any= [];
  reportingtoo :any = [];
  userType1: any;
  empid1: any;

  
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


  constructor(public accountservice: AccountService,
    public dialog: MatDialog, 
    private formBuilder: FormBuilder, public alterservices: AlertService,
    private router:Router,
    private modalService:NgbModal,
    private route:ActivatedRoute) { }
   
  ngOnInit(): void {
    this.dropdown();

    this.form = this.formBuilder.group({
      role: ['', Validators.required],
     // usergrp: ['', Validators.required],
      designation: ['', Validators.required],
      building: ['', Validators.required],
      floor: ['', Validators.required],
      org: ['', Validators.required],
      branch: ['', Validators.required],
      firstname: ['', Validators.required],
      middlename: ['', Validators.required],
      lastname: ['', Validators.required],
      title: ['', Validators.required],
      email:['',[Validators.required,Validators.pattern('[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]],
      eightid: ['', [Validators.required,Validators.pattern('[a-z0-9A-Z\s]{2,10}')]],
      scode: ['', Validators.required],
      loginname: [''],
      empid: ['',[ Validators.required,Validators.pattern('[a-z0-9A-Z\s]{2,10}')]],
      usertype: ['Login User', Validators.required],
      reportingto : ['', Validators.required],
      department: ['', Validators.required],
      password: [''],
      vipstatus: ['', Validators.required],
      description: [''],
      landline:['',Validators.pattern('[0-9]{10,11}')],
      mobile:['',Validators.pattern('[0-9]{10}')],
      deskno:[''],
      repempid:[''],
      actionid:[this.accountservice.user.userid],
      supgrp:[''],
      empStatus:[''],
      newempid:['', Validators.required],
      rejoindt:['', Validators.required],
      user_id:[''],
    });


    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

    this.accountservice.getbyuser(assetid)
    .subscribe(async (details) => {
        (details)
         if(details){
          let asset = details.rows[0];
          asset.reportingto = asset.reportingto+'/'+asset.repempid;
          this.getFloor(asset.building);

          setTimeout(() => {
            this.form.patchValue(asset);  
            this.form.patchValue({
              usertype:'Login User'
            })
          }, 900);                   
         }           
    });
  });

 

  }

  get f() { return this.form.controls; }

  toggle() {
    this.sys = !this.sys;

    // CHANGE THE NAME OF THE BUTTON.
    if (this.sys)
      this.buttonName = "Hide";
    else
      this.buttonName = "Show";

  }
  toggle1() {
    this.contact = !this.contact;

    // CHANGE THE NAME OF THE BUTTON.
    if (this.contact)
      this.buttonName = "Hide";
    else
      this.buttonName = "Show";

  }
  dropdown() {
    this.accountservice.title().subscribe(data => {
      this.products7 = data.rows;
    }),
      this.accountservice.organization().subscribe(data => {
        this.products8 = data.rows;
      }),

      this.accountservice.building().subscribe(data => {
        this.products9 = data.rows;
      }),
      this.accountservice.branch().subscribe(data => {
        this.products10 = data.rows;
      }),
      this.accountservice.sectioncode().subscribe(data => {
        this.products11 = data.rows;
      }),
      this.accountservice.getUserGroup().subscribe(data => {
        this.usergrp = data.rows;
      }),
      this.accountservice.getUserRole().subscribe(data => {
        this.role = data.rows;
      }),
      this.accountservice.designation().subscribe(data => {
        this.designation = data.rows;
      }),
    this.accountservice.department().subscribe(data => {
      this.department = data.rows;
    }),
    this.accountservice.usertype().subscribe(data => {
      this.usertype = data.rows;
    }),
    this.accountservice.reportingtoo().subscribe(data => {
      this.reportingtoo = data.rows;
    })

  }

  getFloor(building:any){

    this.accountservice.floor(building)
        .subscribe(floor => {
            this.floor = floor.rows;
        });
  }

  onSubmit() {
   debugger;
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    this.empid1 = this.form.value.reportingto.split('/');
    this.form.value.reportingto = this.empid1[0];
    this.form.value.repempid = this.empid1[1];

    // stop here if form is invalid
    if (this.form.invalid) {
      this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
      return;
    }

    this.loading = true;
    this.createUser();

  }

  createUser() {
   (this.form);

    this.accountservice.rejoinUser(this.form.value)
      .subscribe(res => {
        this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
        //console.log(res[0].Status);
       (res);
        this.loading = false;
       if(res.Status === 'User Activated !!'){
      
        this.router.navigate(['/home/users/userlist'])
         this.alterservices.success(res.Status, {autoClose:true, keepAfterRouteChange: true });
        
       }else if(res.message){
        this.alterservices.success(res.message, {autoClose:true, keepAfterRouteChange: true });
        
       }
     else if(res.error){
        this.alterservices.error(res.error, {autoClose:true, keepAfterRouteChange: true });
       
       }
      
      
      },
        error => {
          this.loading = false;
          this.alterservices.error(error);
         
        }
      );
      this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
      

  }


  addField(item:any){
  
    const dialogRef = this.dialog.open(UserAddFieldComponent, {
      width: 'auto',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      data : {data:item}
    });

    dialogRef.afterClosed().subscribe(result => {
      if(item === 'Designation'){
        this.accountservice.designation().subscribe(data => {
          this.designation = data.rows;
        })
      }else if(item === 'department'){
        this.accountservice.department().subscribe(data => {
          this.department = data.rows;
        })
      }
      else if(item === 'Section Code'){
        this.accountservice.sectioncode().subscribe(data => {
          this.products11 = data.rows;
        })
      }
      else if(item === 'Branch'){
        this.accountservice.branch().subscribe(data => {
          this.products10 = data.rows;
        })
      }
      else if(item === 'Building'){
        this.accountservice.building().subscribe(data => {
          this.products9 = data.rows;
        })
      }
     


    
     ('The dialog was closed');
    });


  }

  osystem(item:any){
    // this.osys = os;
    if(item === 'ADD NEW Department' ){
      (document.getElementById('exampleModal1') as HTMLInputElement).click();

    }
    else if(item === 'ADD NEW Designation'){
      (document.getElementById('exampleModal2') as HTMLInputElement).click();
   
    }
    else if(item === 'ADD NEW Building'){
      (document.getElementById('exampleModal3') as HTMLInputElement).click();
     
    }
    else if(item === 'ADD NEW Section Code'){
      (document.getElementById('exampleModal4') as HTMLInputElement).click();

    }
    else if(item === 'ADD NEW Floor'){
      (document.getElementById('exampleModal5') as HTMLInputElement).click();
  
    }
    else if(item === 'ADD NEW Branch'){
      (document.getElementById('exampleModal6') as HTMLInputElement).click();
 
    }
  
  }

     
  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
  close(){
         this.router.navigate(['/home/users/leftemplist']);
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e:any) {
 //('window', e);
}

 

divScroll(e:any) {
 //('div App', e);
}


}


