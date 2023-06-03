import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { AlertService } from 'src/app/_services';
import { AssetService } from 'src/app/_services/asset.service';

export interface DialogData{
    data:string
}
@Component({
  selector: 'app-add-field',
  templateUrl: './add-field.component.html',
  styleUrls: ['./add-field.component.css']
})
export class AddFieldComponent implements OnInit {

  form: FormGroup;
  formcustodian: FormGroup;
  loading = false;
  submitted = false;
  formOS: FormGroup;
  formMake: FormGroup;
  formProcessor: FormGroup;
  formRam: FormGroup;
  formHdd: FormGroup;
  formGpu: FormGroup;
  operartingSystem: any;
  vendor: any;
  manufacture: any;
  processor: any;
  ramType: any;
  hardType: any;
  gpuRam: any;
  
  constructor(
    public dialogRef: MatDialogRef<AddFieldComponent>,
    private formBuilder: FormBuilder,
    public alterservices: AlertService,
    public assetService: AssetService,
    @Inject(MAT_DIALOG_DATA) public dialogData: DialogData
  ) { }

  ngOnInit(): void {

    this.dropdown();

    this.form = this.formBuilder.group({
      vname:['',Validators.required],
      vlocation:['',Validators.required]
    }),

    this.formcustodian = this.formBuilder.group({
      custodian:['',Validators.required],
     
    }),

    this.formOS = this.formBuilder.group({
      os:['',Validators.required],
      sp:['',Validators.required],
      bit:['',Validators.required]
    }),
    this.formMake = this.formBuilder.group({
      make:['',Validators.required],
      model:['',Validators.required],
    }),
    this.formProcessor = this.formBuilder.group({
      processor:['',Validators.required],
      speed:['',Validators.required],
    }),
    this.formRam = this.formBuilder.group({
      rtype:['',Validators.required],
      rsize:['',Validators.required],
      ruom:['',Validators.required]
    }),
    this.formHdd = this.formBuilder.group({
      hddtype:['',Validators.required],
      hddsize:['',Validators.required],
      hdduom:['',Validators.required]
    }),
    this.formGpu = this.formBuilder.group({
      gpucard:['',Validators.required],
      gpusize:['',Validators.required],
      gpuuom:['',Validators.required]
    })
  }

  
  get f() { return this.form.controls; }
  get fOS() { return this.formOS.controls; }
  get formM() { return this.formMake.controls; }
  get formP() { return this.formProcessor.controls; }
  get formR() { return this.formRam.controls; }
  get formh() { return this.formHdd.controls; }
  get formG() { return this.formGpu.controls; }

  get formCusto() { return this.formcustodian.controls; }
  
  onNoClick() {
    this.dialogRef.close();
  }

  dropdown(){
    this.assetService.operatingSystem().subscribe(data => {
      this.operartingSystem = data.rows;
    }),
    this.assetService.vendor().subscribe(data => {
      this.vendor = data.rows;
    }),
    this.assetService.manufacture().subscribe(data => {
      this.manufacture = data.rows;
    }),
    this.assetService.processer().subscribe(data => {
      this.processor = data.rows;
    }),
    this.assetService.ramType().subscribe(data => {
      this.ramType = data.rows;
    }),
    this.assetService.hardDisk().subscribe(data => {
      this.hardType = data.rows;
    }),
    this.assetService.gpuDisk().subscribe(data => {
      this.gpuRam = data.rows;
    })
    // this.assetService.spDropdown().subscribe(data => {
    //   this.operartingSystem = data.rows;
    // })

  }

  onSubmit(){

    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.form.invalid) {
    
      return;
    }
    this.loading = true;
   

    this.createvendor();

  }

  createvendor(){
    this.assetService.newVendor(this.form.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }

  onSubmitCustodian(){
    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formcustodian.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.custodianadd(this.formcustodian.value)

    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }

  onSubmitOS(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formOS.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.newOS(this.formOS.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }


  onSubmitMake(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formMake.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.newMake(this.formMake.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }


  onSubmitProcessor(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formProcessor.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.newProc(this.formProcessor.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }


  onSubmitRam(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formRam.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.newram(this.formRam.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }


  onSubmitHDD(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();

    // stop here if form is invalid
    if (this.formHdd.invalid) {
    
      return;
    }
    this.loading = true;

    this.assetService.newhdd(this.formHdd.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }


  onSubmitGpu(){

    this.submitted = true;
    
    // reset alerts on submit
    this.alterservices.clear();
    console.log(this.formGpu.value)
    // stop here if form is invalid
    if (this.formGpu.invalid) {  
      return;
    }
    this.loading = true;

    this.assetService.newgpu(this.formGpu.value)
    .subscribe(res => {

      if(res.Status){
        this.onNoClick();
        this.alterservices.success(res.Status, {  autoClose: true, keepAfterRouteChange: true });       
 
      }
          console.log(res);
    })
  }

}

