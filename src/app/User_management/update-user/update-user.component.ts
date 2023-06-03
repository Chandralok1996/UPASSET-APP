import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Observable } from 'rxjs';
import { first, mergeMap } from 'rxjs/operators';
import { AlertService } from 'src/app/_services';
import { AccountService } from '../../_services/account.service';

@Component({
  selector: 'app-update-user',
  templateUrl: './update-user.component.html',
  styleUrls: ['./update-user.component.css']
})
export class UpdateUserComponent implements OnInit {

  @ViewChild('exampleModal', { static: true }) exampleModalRef: ElementRef;
  @ViewChild('closeButton') closeButton;
  public buttonName: any = 'Show';
  public sys: boolean = false;
  public contact: boolean = false;
  loading = false;
  form: FormGroup;
  submitted = false;


  products7;
  products8 = [];
  products9 = [];
  products10 = [];
  products11 = [];
  usergrp = [];
  role = [];
  designation = [];
  department = [];
  floors = [];
  usertype = [];
  reportingtoo = [];
  userType1: any;
  empid1: any;
  
  keyword1='username1';

  
  title1: any;
  fname : any;
  lname: any;
  mname: any;
  email : any;
  desig: any;
  mobile: any;

   
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;
  item: any;

  

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
    console.log(val)
  }




  homeworld: Observable<{}>;
  constructor(public accountservice: AccountService,
    public route:ActivatedRoute,
    private formBuilder: FormBuilder, public alterservices: AlertService,
    private http: HttpClient,
    private router: Router,
    private modalService:NgbModal) { }
    
  ngOnInit(): void {
    this.dropdown();

    this.form = this.formBuilder.group({
      
      actionid:[this.accountservice.user.userid], 
      usorg_id:[this.accountservice.user.orgdet.usorg_id],
       
      
       title: [''],
       firstname: [''],
       middlename: [''],
       lastname: [''],
       usertype: ['Login User', Validators.required],
       loginname: [''],
       password: [''],
       department: [''],
       role: [''],
     
       designation:[''],
       mobile:['',Validators.pattern('[0-9]{10}')],
       deskno:[''],
       email:['',[Validators.required,Validators.pattern('[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$')]],
       org: [''],
       description: [''],
      userid:[''],
      
    });

    // this.homeworld = this.http
    //   .get('http://172.16.15.21:6700/user/api/v1/getbyuser/')
    //   .pipe(mergeMap(character => this.http.get(this.accountservice.user_id)));
    //   console.log(this.homeworld)
    //   this.form.patchValue(this.homeworld);

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

    this.accountservice.getbyuser(assetid)
    .subscribe(async (details) => {
         console.log(details)
          let asset = details.rows[0];
          if(asset.reportingto === null){
            asset.reportingto = null;
          }else{
            asset.reportingto = asset.reportingto+'/'+asset.repempid;
          }

           // this.getFloor(asset.building).then(() =>{       
              this.form.patchValue(asset);  
              this.form.patchValue({
                userid:asset.user_id
              }) 
          //  })
           
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

      // this.accountservice.building().subscribe(data => {
      //   this.products9 = data.rows;
      // }),
      this.accountservice.branch().subscribe(data => {
        this.products10 = data.rows;
      }),
      // this.accountservice.sectioncode().subscribe(data => {
      //   this.products11 = data.rows;
      // }),
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
    this.accountservice.alluserdetails1().subscribe(data => {
      this.reportingtoo = data.rows;
      console.log(this.reportingtoo)
    });

  }



  onSubmit() {
  
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

 
    console.log(this.form.value)

    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }

    this.loading = true;
    this.createUser();

  }

  createUser() {
    console.log(this.form);

    this.accountservice.userUpdate(this.form.value)
      .subscribe(res => {
        console.log(res);
        debugger
        this.loading = false;
        if(res.status){
       
          this.router.navigate(['/home/users/userlist']); 
         
         
        
          this.alterservices.success('User Updated Successfully!!', {autoClose:true, keepAfterRouteChange: true });
        }

        if(res.Error){
         
          this.alterservices.error(res.Error, { keepAfterRouteChange: true });
        
        }
       
      },
        error => {
          this.loading = false;
          this.alterservices.error(error, { keepAfterRouteChange: true });
          
        }
      );
      // this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
     

  }

  
  openVerticallyCentered(content:any) {
    this.modalService.open(content, { centered: true });
  
  
  }
  
   close(){
    this.router.navigate(['home/users/userlist']);
   
    }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  //console.log('div App', e);
}


OnlyNumbersAllowed(event):boolean
{
  const charCode = (event.which)?event.which:event.keyCode;
  if(charCode > 31 && (charCode <48 || charCode > 57))
  {
    console.log('charCode restricted is '+ charCode);
    return false;
  }
  return true;
}


selectEvent(item) {
  console.log(item)
  this.item = item;
  console.log(this.item.username1)
  this.form.value.reportingto = this.item.username1;
 // this.empid2 = item.username1
}

onChangeSearch(val: string) {
 // fetch remote data from here
 // And reassign the 'data' which is binded to 'data' property.
}

onFocused(e){
 // do something when input is focused
}

}


