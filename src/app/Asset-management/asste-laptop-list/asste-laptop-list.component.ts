
import { any } from '@amcharts/amcharts4/.internal/core/utils/Array';
import { Component, ElementRef, HostListener, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { AssetSortComponent } from 'src/app/Asset-Report/asset-sort/asset-sort.component';
import { AttachmentComponent } from 'src/app/attachment/attachment.component';
import { assetlist } from 'src/app/_models/asset';
import { AssetService } from '../../_services/asset.service';
import { AssteDektopComponent } from '../asste-dektop/asste-dektop.component';
import { AssteLaptopComponent } from '../asste-laptop/asste-laptop.component';
import { AssteServerComponent } from '../asste-server/asste-server.component';
import { UpdateDesktopComponent } from '../update-desktop/update-desktop.component';
import { AddFieldComponent } from '../add-field/add-field.component';
import { AlertService } from 'src/app/_services';


declare var $: any;
@Component({
  selector: 'app-asste-laptop-list',
  templateUrl: './asste-laptop-list.component.html',
  styleUrls: ['./asste-laptop-list.component.css']
})
export class AssteLaptopListComponent implements OnInit {
  @ViewChild('exampleModal', { static: true }) exampleModalRef!: ElementRef;
  @ViewChild('closeButton') closeButton:any;
  public sidebarShow: boolean = false;

  allUser!: assetlist[];
  dataSource!: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  displayedColumns: string[] = ['assetid','assetname', 'owner_name','serialno', 'status','custodian','actions'];

  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  form: any;
  submitted = false;
  assetty: any;
  assetcat: any;
  confide: any;

  loading = false;
  mak: any;
  integ: any;
  avail: any;
  fam: any;
  loc: any;
  custod: any;
  owner: any;
  assetmod: any;
  assetgrop: any;
  result1: any;
  result: any;
  categoryType:any;
  grpMst: any;
  mkMst: any;
  modMst: any;

  formtype: any;
  formcate: any;
  formgrop: any;
  formake: any;
  formodel: any;
  formcustodian: any;
  formconfid: any;
  forminteg: any;
  formlocat: any;
  formavail: any;
  formfam: any;
  rowData: any;


  formSubmit(val: any) {
    console.log(val)
  }

  constructor(
    private formBuilder: FormBuilder,
     public assetservice: AssetService,
    public router: Router,
    public dialog: MatDialog,
    public alterservices: AlertService,
    private modalService: NgbModal
    ) {


  }


  ngOnInit(): void {
    this.updateData();
    this.dropdown();

    this. formcate = this.formBuilder.group({
      category:['',Validators.required],

    }),
    this. formgrop = this.formBuilder.group({
      astg_group:['',Validators.required],

    }),

    this. formake = this.formBuilder.group({
      make:['',Validators.required],

    }),

    this. formodel = this.formBuilder.group({
      model:['',Validators.required],

    }),

    this.formcustodian = this.formBuilder.group({
      custodian:['',Validators.required],

    }),

    this. formconfid = this.formBuilder.group({
      confident:['',Validators.required],

    }),

    this. forminteg = this.formBuilder.group({
      inte:['',Validators.required],

    }),

    this. formlocat = this.formBuilder.group({
      location:['',Validators.required],

    }),

    this. formavail = this.formBuilder.group({
      avail:['',Validators.required],

    }),
    this. formtype = this.formBuilder.group({
      type:['',Validators.required],

    }),
    this. formfam = this.formBuilder.group({
      family:['',Validators.required],

    })

    this.form = this.formBuilder.group({

      assettype:['',Validators.required],
      assetcat:['',Validators.required],
      assetgroup:['',Validators.required],
      assetname:['', Validators.required],
      srno:['', Validators.required],
      model:['', Validators.required],
      make:['', Validators.required],
      hostname:[null],
      quantity:[null],
      assetid:['', Validators.required],
      custodian:['', Validators.required],
      location:['', Validators.required],
      assetowner:['', Validators.required],
      confident:['', Validators.required],
      integrity:['', Validators.required],
      availibility:['', Validators.required],
      family:[null],
      wedate:[null],
      wsdate:[null],
      // warranty:[''],
      // description:[''],
    })

  }


  get f() { return this.form.controls; }
  get formType() { return this.formtype.controls; }
  get formCat() { return this.formcate.controls; }
  get formGrp() { return this.formgrop.controls; }
  get formMake() { return this.formake.controls; }
  get formMode() { return this.formodel.controls; }
  get formCusto() { return this.formcustodian.controls; }
  get formConf() { return this.formconfid.controls; }
  get formInt() { return this.forminteg.controls; }
  get formLoca() { return this.formlocat.controls; }
  get formAvai() { return this.formavail.controls; }
  get formFami() { return this.formfam.controls; }

  updateData(){
    this.assetservice.assetlist().subscribe(data => {
      this.tabledata = data.rows;
      this.rowData = data.rowCount;
      console.log(this.tabledata);
      this.dataSource = new MatTableDataSource( this.tabledata );
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator;

    });

  }

  onRowClicked(row: any) {
    console.log('Row clicked: ', row);
  }

  isAllSelected() {
    const numSelected = this.selection.selected.length;
    const numRows = this.dataSource.data.length;
    return numSelected === numRows;
  }

  masterToggle() {
       this.isAllSelected() ?
      this.selection.clear() :
      this.dataSource.data.forEach(row => this.selection.select(row));
  }
  openDialog(): void {
    this.router.navigate(['/home/users/laptopcreation']);

  }


  OpenUpdate(astd_id:any){
    console.log(astd_id);
    this.assetservice.astd_id = astd_id;
    this.router.navigate(['/home/users/updatedesktop',astd_id]);
  }

  applyFilter(event: any) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


openAttachment(astdid:any,ast_grp:any){
  this.assetservice.att_astg_grp = ast_grp
  this.assetservice.att_astdid = astdid;

  const dialogRef = this.dialog.open(AttachmentComponent, {
    width: '600px',
    height: '200px',
    scrollStrategy: new NoopScrollStrategy(),
    disableClose:true,
    position: {top:'7.7%'}

  });

  dialogRef.afterClosed().subscribe(result => {
    console.log('The dialog was closed');

  });

}

openFilter(): void {
  const dialogRef = this.dialog.open(AssetSortComponent, {
    width: '653px',
    height: '350px',
    scrollStrategy: new NoopScrollStrategy(),
    disableClose:true,
    position: {top:'7.6%'}
  });

  dialogRef.afterClosed().subscribe(result => {
    console.log('The dialog was closed');

  });
}


divScroll(e:any) {
  //console.log('div App', e);
}




dropdown(){
  this.assetservice.assettype().subscribe(data => {
    this.assetty = data.rows;
    console.log(this.assetty);
  }),

  this.assetservice.custodian().subscribe(data => {
    this.custod = data.rows;
    console.log(this.custod);
  }),

  this.assetservice.assetowner().subscribe(data => {
    this.owner = data.rows;
    console.log(this.owner);
  }),

  this.assetservice.location().subscribe(data => {
    this.loc = data.rows;
    console.log(this.loc);
  }),
  this.assetservice.confidential().subscribe(data => {
    this.confide  = data.rows;
    console.log(this.confide );
  }),
  // this.assetservice.makee().subscribe(data => {
  //   this.mak = data.rows;
  //   console.log(this.mak);
  // }),
  this.assetservice.integrity().subscribe(data => {
    this.integ = data.rows;
    console.log(this.integ);
  }),
  this.assetservice.availibility().subscribe(data => {
    this.avail = data.rows;
    console.log(this.avail);
  }),
  this.assetservice.family().subscribe(data => {
    this.fam = data.rows;
    console.log(this.fam);
  })

}

//For popupmodel masterdata
mastype(item:any){
  
  if(item === 'ADD NEW Type' ){
(document.getElementById('typeModel') as HTMLInputElement).click();
  }
}

mastcat(item:any){
  if(item === 'ADD NEW Category' ){
    (document.getElementById('catModel') as HTMLInputElement).click();
 
  }
}

mastgrp(item:any){
  if(item === 'ADD NEW Group' ){
    (document.getElementById('grpModel') as HTMLInputElement).click();
  }
}
mastmk(item:any){
  if(item === 'ADD NEW Make' ){
    (document.getElementById('makeModel') as HTMLInputElement).click();
  }
}
mastmod(item:any){
  if(item === 'ADD NEW Model' ){
    (document.getElementById('mModel') as HTMLInputElement).click();
  }
}

custodd(item:any){
  if(item === 'ADD NEW CUSTODIAN' ){
    (document.getElementById('exampleModal') as HTMLInputElement).click();
  }
}

confid(item:any){
  if(item === 'ADD NEW Confidentiality' ){
    (document.getElementById('exampleModal2') as HTMLInputElement).click();
  }
}

assetown(item:any){
  if(item === 'ADD NEW Integrity' ){
    (document.getElementById('exampleModal1') as HTMLInputElement).click();
  }
}

locatio(item:any){
  if(item === 'ADD NEW Location' ){
    (document.getElementById('locationModel') as HTMLInputElement).click();
  }
}
availib(item:any){
  if(item === 'ADD NEW Availibility' ){
    (document.getElementById('availModel') as HTMLInputElement).click();
  }
}

fami(item:any){
  if(item === 'ADD NEW Family' ){
    (document.getElementById('famModel') as HTMLInputElement).click();
  }
}


assetcatagory(event:any)
{
  const astt_id = event.target ? (event.target as HTMLInputElement).value : event;
  this.categoryType = astt_id
  this.assetservice.assetcat(astt_id).subscribe(data => {
    this.assetcat = data.rows;
    console.log(this.assetcat);
  })
}

assetgroup(event:any)
{
  const astc_id = event.target ? (event.target as HTMLInputElement).value : event;
  console.log(astc_id)
  this.grpMst = astc_id
  this.assetservice.assetgrp(astc_id).subscribe(data => {
    this.assetgrop = data.rows;
    console.log(this.assetgrop);
  })
}

assetmake(event:any)
{
  const astg_id = event.target ? (event.target as HTMLInputElement).value : event;
  console.log(astg_id)
  this.mkMst = astg_id
  this.assetservice.makee(astg_id).subscribe(data => {
    this.mak = data.rows;
    console.log(this.mak);
  })
}


assetmodel(event:any)
{
  const astupmk_id = event.target ? (event.target as HTMLInputElement).value : event;
  console.log(astupmk_id)
  this.modMst = astupmk_id
  this.assetservice.model(astupmk_id).subscribe(data => {
    this.assetmod = data.rows;
    console.log(this.assetmod);
  })
}
onSubmit(){
  debugger
  this.submitted = true;


   // stop here if form is invalid
   if(this.form.invalid) {
    return;
  }

      if(this.form.value.hostname=="")
      {
        this.form.value.hostname=null
  
      }
      else
      {
      }
      if(this.form.value.quantity=="")
      {
        this.form.value.quantity=null
  
      }
      else
      {
      }
      if(this.form.value.family=="")
      {
        this.form.value.family=null
  
      }
      else
      {
      }
      if(this.form.value.wsdate=="")
      {
        this.form.value.wsdate=null
  
      }
      else
      {
      }
      if(this.form.value.wedate=="")
      {
        this.form.value.wedate=null
  
      }
      else
      {
      }

this.loading = true;
this.assetcretmanagement();

}

assetcretmanagement() {
  console.clear();
  this.assetservice.createasset(this.form.value)
    .subscribe(res => {
      var allData = res
      this.loading = false;

        if (res.status) {
          this.ngOnInit();
            this.closeButton.nativeElement.click();
            // this.router.navigate(['/home/users/userlist']);
            $('#exampleModalLong').modal('show');
            this.result = "Congratulations ! Asset Created Succesfully"

        }
          else  {
            this.closeButton.nativeElement.click();
            this.result1 = res.message;
            $('#exampleModalLong1').modal('show');
            this.result = res.message;
            // setTimeout(function () {
            //   $('#exampleModalLong1').modal('hide')
            // }, 2500);
          }

       

    },
      error => {
        this.loading = false;
        this.alterservices.error(error, { autoClose: true, keepAfterRouteChange: true });

      }

    )


   

  // this.form.value.name = this.form.value.name + '/' + this.form.value.empid;

}





onSubmitCateg(){
  this.submitted = true;
  this.alterservices.clear();

  if (this.formcate.invalid) {
    return;
  }
  this.loading = true;
  var data = {
    category: this.formcate.value.category,
    astt_id: this.categoryType
  }

  this.assetservice.mastcateadd(data)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
      this.assetcatagory(this.categoryType);
    }
       console.log(data);
  })
}


onSubmitGrp(){
  this.submitted = true;
  this.alterservices.clear();

  if (this.formgrop.invalid) {
    return;
  }
  this.loading = true;
  var data = {
    astg_group: this.formgrop.value.astg_group,
    astc_id: this.grpMst
  }

  this.assetservice.mastgrpadd(data)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
      this.assetgroup(this.grpMst);
    }
  })
}


onSubmitMk(){

  this.submitted = true;
  this.alterservices.clear();

  if (this.formake.invalid) {
    return;
  }
  this.loading = true;
  var data = {
    make: this.formake.value.make,
    astg_id: this.mkMst
  }

  this.assetservice.mastmkadd(data)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
      this.assetmake(this.mkMst);
    }
  })
}

OnlyNumbersAllowed(event: any): boolean {
  const charCode = event.which ? event.which : event.keyCode;
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
    console.log('charCode restricted is ' + charCode);
    return false;
  }
  return true;
}

onSubmitModel(){

  this.submitted = true;
  this.alterservices.clear();

  if (this.formodel.invalid) {
    return;
  }
  this.loading = true;
  var data = {
    model: this.formodel.value.model,
    astupmk_id: this.modMst
  }

  this.assetservice.mastmodeladd(data)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
      this.assetmodel(this.modMst);
    }
      
  })
}


onSubmitCustodian(){
  this.submitted = true;
  this.alterservices.clear();
  // stop here if form is invalid
  if (this.formcustodian.invalid) {
    return;
  }
  this.loading = true;
  this.assetservice.custodianadd(this.formcustodian.value)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
    }

  })
}


onSubmitType(){
  this.submitted = true;
  this.alterservices.clear();
  // stop here if form is invalid
  if (this.formtype.invalid) {
    return;
  }
  this.loading = true;
  this.assetservice.masttypeadd(this.formtype.value)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
    }
        console.log(res);
  })
}

onSubmitConfident(){
  this.submitted = true;

  // reset alerts on submit
  this.alterservices.clear();

  // stop here if form is invalid
  if (this.formconfid.invalid) {

    return;
  }
  this.loading = true;

  this.assetservice.masterconfidentadd(this.formconfid.value)

  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });

    }
        console.log(res);
  })
}


onSubmitInteg(){
  this.submitted = true;

  // reset alerts on submit
  this.alterservices.clear();

  // stop here if form is invalid
  if (this.forminteg.invalid) {

    return;
  }
  this.loading = true;

  this.assetservice.masterintegadd(this.forminteg.value)

  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });

    }
        console.log(res);
  })
}


onSubmitLoc(){
  this.submitted = true;
  this.alterservices.clear();
  // stop here if form is invalid
  if (this.formlocat.invalid) {
    return;
  }
  this.loading = true;
  this.assetservice.mastlocadd(this.formlocat.value)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
    }
        console.log(res);
  })
}

onSubmitAvail(){
  this.submitted = true;
  this.alterservices.clear();
  // stop here if form is invalid
  if (this.formavail.invalid) {
    return;
  }
  this.loading = true;
  this.assetservice.mastavailadd(this.formavail.value)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
    }
        console.log(res);
  })
}


onSubmitfamily(){
  this.submitted = true;
  this.alterservices.clear();
  // stop here if form is invalid
  if (this.formfam.invalid) {
    return;
  }
 
  this.loading = true;
  this.assetservice.mastfamadd(this.formfam.value)
  .subscribe(res => {
    console.log(res)
    this.closeModel();
    if(res.message){
      this.ngOnInit();
      this.alterservices.success(res.message, {  autoClose: true, keepAfterRouteChange: true });
    }
        console.log(res);
  })
}

addTy(){
  $('#createTyp').modal('show');
}
catModell(){
  $('#createCat').modal('show');
}
grpModell(){
  $('#createGrp').modal('show');
}
makModell(){
  $('#mkModel').modal('show');
}
modModell(){
  $('#modModel').modal('show');
}

addCusto(){
  $('#custModel').modal('show');
}

addLoc(){
  $('#locModel').modal('show');
}

addConfi(){
  $('#confModel').modal('show');
}
addInteg(){
  $('#integModel').modal('show');
}

addAvail(){
  $('#avaiModel').modal('show');
}
addfam(){
  $('#familyModel').modal('show');
}

closeModel(){
  $('#createTyp').modal('hide');
  $('#createCat').modal('hide');
  $('#createGrp').modal('hide');
  $('#mkModel').modal('hide');
  $('#modModel').modal('hide');
  $('#custModel').modal('hide');
  $('#locModel').modal('hide');
  $('#confModel').modal('hide');
  $('#integModel').modal('hide');
  $('#avaiModel').modal('hide');
  $('#familyModel').modal('hide');
}


}






