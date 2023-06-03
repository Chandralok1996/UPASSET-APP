import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AccountService } from 'src/app/_services/account.service';
import { AlertService } from 'src/app/_services/alert.service';


@Component({
  selector: 'app-update',
  templateUrl: './update.component.html',
  styleUrls: ['./update.component.css']
})

export class UpdateComponent implements OnInit {
 
  form: FormGroup;
  submitted: boolean;
  loading: boolean;
  result: any;
  customerservice: any;
  

 isNewAdd= false
  addDisplay()
  {
    this.isNewAdd = !this.isNewAdd;
 
  }
 


 
  constructor( private formBuilder: FormBuilder,
    public alterservices: AlertService,
    private router: Router,
    private accountservice: AccountService,) { }
 
 
  ngOnInit(): void {
 
    this.form = this.formBuilder.group({
      userid:['', Validators.required],
      password: ['', Validators.required],
      conpassword: ['', Validators.required]
      })
 
  }
  get f() { return this.form.controls; }
  open(){
    this.router.navigate(['/login']);
  }
  onSubmit() {
    debugger

  
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
 
    this.accountservice.reset(this.form.value)
      .subscribe(res => {
       // this.form.value.reportingto = this.empid1[0]+'/'+ this.empid1[1];
       this.loading = false;
        console.log(res);
        // if(res){
        //  this.result = res;
        //   this.alterservices.error(res.message, {autoClose:true, keepAfterRouteChange: true });
        // }
        // else if(res.error){
        //   this.alterservices.error(res.error, { autoClose:true, keepAfterRouteChange: true });
        // }
      
      
         if(res.status){
        this.router.navigate(['/home/users/userlist']);
        this.alterservices.success(res.message, { autoClose: true, keepAfterRouteChange: true });
                // this.alterservices.success(res.Status, {autoClose:true, keepAfterRouteChange: true });
        }
       
      },
        error => {
          this.loading = false;
          this.alterservices.error(error , {autoClose:true, keepAfterRouteChange: true });
         
        }
      );
 
  }
 
 
 
}

