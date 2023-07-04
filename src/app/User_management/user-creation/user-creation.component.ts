
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, ValidatorFn, Validators } from '@angular/forms';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { first } from 'rxjs/operators';
import { AlertService } from 'src/app/_services';
import { AccountService } from '../../_services/account.service';
import { UserAddFieldComponent } from '../user-add-field/user-add-field.component';

@Component({
  selector: 'app-user-creation',
  templateUrl: './user-creation.component.html',
  styleUrls: ['./user-creation.component.css']
})
export class UserCreationComponent implements OnInit {
  @ViewChild('exampleModal', { static: true }) exampleModalRef!: ElementRef;
  @ViewChild('closeButton') closeButton:any;
  public buttonName: any = 'Show';
  public sys: boolean = false;
  public contact: boolean = false;
  loading:boolean = false;
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
  usertype :any = [];
  reportingtoo :any = [];
  userType1: any;
  empid1: any;

  keyword1='username1';
  empid2: any;

  // design code

  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;

  title1: any;
  fname : any;
  lname: any;
  mname: any;
  email : any;
  desig: any;
  mobile: any;
  assetResultLogin: any;
  assetResultEight: any;
  assetResultLocal: any;
  group: any;



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
  formSubmit(val: any) {
   (val)
  }



  constructor(public accountservice: AccountService,
    public dialog: MatDialog, 
    private router: Router,
    private formBuilder: FormBuilder, public alterservices: AlertService,
    private modalService:NgbModal ) { }
   
  ngOnInit(): void {
    this.dropdown();

    this.form = this.formBuilder.group({
     
     
      
     actionid:[this.accountservice.user.userid], 
     usorg_id:[this.accountservice.user.orgdet.usorg_id],
      
     
      title: ['', Validators.required],
      firstname: ['', Validators.required],
      middlename: [''],
      lastname: [''],
      usertype: ['Login User', Validators.required],
      loginname: ['', Validators.required],
      password: ['', Validators.required],
      department: ['', Validators.required],
      role: ['', Validators.required],
      designation: ['', Validators.required],
      mobile:['',Validators.pattern('[0-9]{10}')],
      deskno:[''],
      email:['',[Validators.required,Validators.pattern('[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]],
      org: ['', Validators.required],
      description: [''],
       group : ['', Validators.required],
    });

setTimeout(() => {
  this.form.patchValue({
    vipstatus:'General',
    role:'enduser'
  })
}, 5000);

   
  }

//   private validateUsername(): ValidatorFn {
//     return (control: AbstractControl): {[key: string]: any} => { 
//       return this.accountservice.alluserdetails1().subscribe((data:any) => {
//             let res: any = data;
//            (res);
//            for( let i=0; i<res.length;i++){
//               if(data[i].user_id === control.value){
//                ('exist')
//                 return { 'alreadyExist': true };
//               }
//               else{
//                 return null;
//               }
//            }
         
//           },
//           (error) => {
//            (error);
//           }
//         );
//     }
// }

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

      
      this.accountservice.branch().subscribe(data => {
        this.products10 = data.rows;
      }),
    
        this.accountservice.getUserGroup().subscribe(data => {
          console.log(data);
          
          this.usergrp = data.rows;
          console.log(this.usergrp);
          
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
    // this.accountservice.reportingtoo().subscribe(data => {
    //   this.reportingtoo = data.rows;
    // }),
    this.accountservice.alluserdetails1().subscribe(data => {
      this.reportingtoo = data.rows;
     (this.reportingtoo)
    });

  }

  // getFloor(building){

  //   this.accountservice.floor(building)
  //       .subscribe(floor => {
  //           this.floor = floor.rows;
  //       });
  // }


  onSubmit() {
   debugger;
   this.form.value.firstname = this.form.value.firstname.trim();
  //  this.form.value.lastname = this.form.value.lastname.trim();
  //  this.form.value.middlename = this.form.value.middlename.trim();
  //  this.form.value.empid = this.form.value.empid.trim();
   //this.form.value.eightid = this.form.value.eightid.trim();

    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    // this.empid1 = this.empid2.split('/');
    // this.form.value.reportingto = this.empid1[0];
    // this.form.value.repempid = this.empid1[1];
   (this.form.value);

    // stop here if form is invalid
    if (this.form.invalid) {
      //this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
      return;
    }

    this.loading = true;
    this.createUser();

  }

  createUser() {
    this.accountservice.newUser(this.form.value)
      .subscribe(res => {
       
        this.loading = false;
       if(res.Status === 'User created Successfully'){
      
        this.router.navigate(['/home/users/userlist']);  
         this.alterservices.success('User Created successfully', {autoClose:true, keepAfterRouteChange: true });
        
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

  
  loginName(name:any){
    this.accountservice.validateGetLoginName(name).subscribe(
      data => {
       (data.Status);
        if(data.Status === "User with this login name Already exists!!!"){
              this.assetResultLogin = data.Status;
        }else{
          this.assetResultLogin=''
         
        }
  
      }
    )

  }

  eightidAPI(eightid:any){
    this.accountservice.validateGetEight(eightid).subscribe(
      data => {
       (data.Status);
        if(data.Status === "User with this Eight ID Already exists!!!"){
              this.assetResultEight = data.Status;
        }else{
          this.assetResultEight=''
        
        }
  
      }
    )

  }

  localID(empid:any){
    this.accountservice.validateGetLocalid(empid).subscribe(
      data => {
       (data.Status);
        if(data.Status === "User with this Emp ID Already exists!!!"){
              this.assetResultLocal = data.Status;
        }else{
          this.assetResultLocal=''
        }
  
      }
    )

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


  selectEvent(item:any) {
     this.empid2 = item.username1
  }

  onChangeSearch(val: any) {
  
  }
  
  onFocused(e:any){
    // do something when input is focused
  }

  

  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  }
  
  
  close(){
    
      this.router.navigate(['/home/users/userlist']);
   
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e:any) {
 //('window', e);
}

 

divScroll(e:any) {
  //console.log('div App', e);
}

OnlyNumbersAllowed(event:any):boolean
{
  const charCode = (event.which)?event.which:event.keyCode;
  if(charCode > 31 && (charCode <48 || charCode > 57))
  {
   ('charCode restricted is '+ charCode);
    return false;
  }
  return true;
}

}



