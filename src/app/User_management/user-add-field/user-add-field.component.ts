


import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from 'src/app/_services/asset.service';

export interface DialogData{
    data:string
}
@Component({
  selector: 'app-user-add-field',
  templateUrl: './user-add-field.component.html',
  styleUrls: ['./user-add-field.component.css']
})
export class UserAddFieldComponent implements OnInit {

  form: any;
  loading = false;
  submitted = false;
  formDepartment: any;
  formDesignation: any;
  formBranch: any;
  formBuilding: any;
  formSectioncode: any;
  products9: any;
  
  
  constructor(
    public dialogRef: MatDialogRef<UserAddFieldComponent>,
    private formBuilder: FormBuilder,
    public alterservices: AlertService,
    public assetService: AssetService,
    public accountservice: AccountService,
    @Inject(MAT_DIALOG_DATA) public dialogData: DialogData
  ) { }

  ngOnInit(): void {

    this.dropdown();

    this.formDepartment = this.formBuilder.group({
      deptname:['',Validators.required],
    }),
    this.formDesignation = this.formBuilder.group({
      desgname:['',Validators.required],
    }),
    this.formBranch = this.formBuilder.group({
      branch:['',Validators.required],
     
    }),
    this.formBuilding = this.formBuilder.group({
      building:['',Validators.required],
      floor:['',Validators.required],
    }),
   
    this.formSectioncode = this.formBuilder.group({
      seccode: ['', Validators.required],
     
     
    })
  }

  
 
  get fOS() { return this.formDepartment.controls; }
  get f() { return this.formDesignation.controls; }
  get formP() { return this.formBranch.controls; }
  get formR() { return this.formBuilding.controls; }
  get formG() { return this.formSectioncode.controls; }

  
  onNoClick() {
    this.dialogRef.close();
  }

  dropdown(){
    this.accountservice.building().subscribe(data => {
      this.products9 = data.rows;
    })

  }

  

  onSubmitDepartment(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formDepartment.invalid) {
    
      return;
    }
    this.loading = true;

    this.accountservice.newDepartment(this.formDepartment.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
         (res);
    })
  }


  onSubmitDesignation(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formDesignation.invalid) {
    
      return;
    }
    this.loading = true;

    this.accountservice.newDesignation(this.formDesignation.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
         (res);
    })
  }


  onSubmitBranch(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formBranch.invalid) {
    
      return;
    }
    this.loading = true;

    this.accountservice.newBranch(this.formBranch.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
         (res);
    })
  }


  onSubmitBuilding(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formBuilding.invalid) {
    
      return;
    }
    this.loading = true;

    this.accountservice.newBuilding(this.formBuilding.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
         (res);
    })
  }


  onSubmitScode(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formSectioncode.invalid) {
    
      return;
    }
    this.loading = true;

    this.accountservice.newSeccode(this.formSectioncode.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
         (res);
    })
  }



}

