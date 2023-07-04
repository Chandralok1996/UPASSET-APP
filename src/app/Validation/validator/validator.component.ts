


import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormControl, Validators} from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
  
import { ConfirmValidator } from '../confirm.validator';
    
@Component({
  selector: 'app-validator',
  templateUrl: './validator.component.html',
  styleUrls: ['./validator.component.css']
})
export class ValidatorComponent implements OnInit {
  form: any = new FormGroup({});
  
  constructor(private fb: FormBuilder,
    public dialogRef: MatDialogRef<ValidatorComponent>,
    public accountservice: AccountService,
    public alterservices: AlertService,) {
  
   
  }
  ngOnInit(): void {
   
    this.form = this.fb.group({
      userid:[this.accountservice.user_id1],
      empid:[this.accountservice.empid1 ,Validators.required],
      password: ['', [Validators.required]],
      confirm_password: ['', [Validators.required]]
    }, { 
      validator: ConfirmValidator('password', 'confirm_password')
    })
   
  }
    
  get f(){
    return this.form.controls;
  }
   
  submit(){
   (this.form.value);

    this.accountservice.passwordUpdate(this.form.value)
    .subscribe(res => {
     (res);
      this.onNoClick();
      this.alterservices.success('Password Updated successfully', { autoClose:true, keepAfterRouteChange: true });
     
    },
      error => {
       
        this.alterservices.error(error, { keepAfterRouteChange: true });
       
      }
    );


  }

  onNoClick() {
    this.dialogRef.close();
  }
   
}