
import { HttpClient } from '@angular/common/http';
import { Component, HostListener, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from '../../_services/asset.service';
import { MatDialog } from '@angular/material/dialog';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { AddFieldComponent } from '../add-field/add-field.component';

@Component({
  selector: 'app-update-desktop',
  templateUrl: './update-desktop.component.html',
  styleUrls: ['./update-desktop.component.css']
})
export class UpdateDesktopComponent implements OnInit, OnChanges {
  form: FormGroup;
  submitted = false;
  assetty: any;
  assetcat: any;
  confide: any;
  result1: any;
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

  
  div1: boolean = true;
  div2: boolean = true;
  div3: boolean = true;
  statusClass = 'not-active';
  statusClasses = 'not-active';
  statusClassess = 'not-active';
  orga: any;
  asset: any;
  status: any;
  JsonModel: any;


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
    public fb: FormBuilder,
    public route:ActivatedRoute, 
    private formBuilder: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog,
    private modalService:NgbModal,
    public alterservices: AlertService,) { }
    

  ngOnChanges(changes: SimpleChanges) {
   
      console.log(changes);
   // this.dropdown();
    //this.userdet();
  }
   

   ngOnInit() {

    
    this.form = this.formBuilder.group({ 
      type:[''],
      category:[''],
      astg_group:[''],
      asset_name:[''],
      serialno:[''],
      model:[''],
      make:[''],
      hostname:[''],
      quantity:[''],
      asset_id:[''],
      custodian:[''],
      location:[''],
      assetowner:[''],
      conf:[''],
      inte:[''],
      avail:[''],
      family:[''],
      warranty:[''],
      wedate:[''],
      wsdate:[''],
      description:[''],
      astd_id:[''],
      status: ['', Validators.required],
    });
   
    this.dropdown();
 
    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');

      this.assetservice.getbyasset(assetid)
      .subscribe(async (details) => {
        console.log(details)
        this.asset = details.rows[0];
        console.log(this.asset)

        this.JsonModel=this.asset.model;
        console.log(this.JsonModel)


        this.assetcatagory(this.asset.type);
        
        // setTimeout(() => {
        //   this.assetgroup(this.asset.category);
            
        // }, 200);

        // setTimeout(() => {
        //   this.assetmake(this.asset.astg_group);
            
        // }, 500);
        
        // setTimeout(() => {
        //   this.assetmodel(this.asset.make);
            
        // }, 800);
      
        setTimeout(() => {
         // this.form.patchValue(this.asset);  
          //  this.form.patchValue({
       
          //   wedate:this.asset.wedate,
          //   wsdate:this.asset.wsdate
          //  })      
        }, 200);

      })
 
    
});


  }


  

  get f() { return this.form.controls; }

  dropdown(){
    this.assetservice.assetowner().subscribe(data => {
      this.owner = data.rows;
      console.log(this.owner);
    }),
    this.assetservice.assettype().subscribe(data => {
      this.assetty = data.rows;
      console.log(this.assetty);
    }),
    
    this.assetservice.custodian().subscribe(data => {
      this.custod = data.rows;
      console.log(this.custod);
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
    }),
    this.assetservice.statuss().subscribe(data => {
      this.status = data.rows;
      console.log(data)
    })
   
  }
  
  
//For popupmodel under custodian
custodd(item){
  if(item === 'ADD NEW CUSTODIAN' ){
    document.getElementById('exampleModal').click();
  }
}

addField(item){

  const dialogRef = this.dialog.open(AddFieldComponent, {
  width: 'auto',
  scrollStrategy: new NoopScrollStrategy(),
  disableClose:true,
  data : {data:item}
  });
  
  
  
  dialogRef.afterClosed().subscribe(result => {
  if(item === 'custo'){
    this.assetservice.custodian().subscribe(data => {
      this.custod = data.rows;
      console.log(this.custod);
    })
  }
  
  console.log('The dialog was closed');
  });
  
  
  }
assetcatagory(astt_id)
{
  console.log(astt_id)

//passing id in assettype
let typee = this.assetty.filter((data: { type: any; }) => {
  if (data.type === astt_id) {
    return data;
  }

})
console.log(typee);
// this.form.value.assettype = typee[0].astt_id;

  this.assetservice.assetcat(typee[0].astt_id).subscribe( data => {
    this.assetcat = data.rows;
    console.log(this.assetcat);
    if(this.assetcat){
      this.assetgroup(this.asset.category);
    }

  })
}

assetgroup(astc_id)
{
  console.log(astc_id)

  //passing id in assetcategory
let cat = this.assetcat.filter((data: { category: any; }) => {
  if (data.category === astc_id) {
    return data;
  }

})
console.log(cat);
// this.form.value.category = cat[0].astc_id;

  this.assetservice.assetgrp(cat[0].astc_id).subscribe(data => {
    this.assetgrop = data.rows;
    console.log(this.assetgrop);
    if(this.assetgrop){
      this.assetmake(this.asset.astg_group);
    }
  })
}
assetmake(astg_id)
{
  console.log(astg_id)

 
//passing id in assetgrop
let grp = this.assetgrop.filter((data: { astg_group: any; }) => {
  if (data.astg_group === astg_id) {
    return data;
  }

})
console.log(grp);
// this.form.value.astg_group = grp[0].astg_id;

  this.assetservice.makee(grp[0].astg_id).subscribe(data => {
    this.mak = data.rows;
    console.log(this.mak);
    if(this.mak){
      this.assetmodel(this.asset.make);
    }
  })
}


assetmodel(astupmk_id)
{
  console.log(astupmk_id)
 this.JsonModel="Select asset model";
  //passing id in make
let ma = this.mak.filter((data: { make: any; }) => {
  if (data.make === astupmk_id) {
    return data;
  }

})
console.log(ma);

// this.form.value.make = ma[0].astupmk_id;
  this.assetservice.model(ma[0].astupmk_id).subscribe(data => {
    this.assetmod = data.rows;
   
    console.log(this.assetmod);
    
    if(this.assetmod){
      this.form.patchValue(this.asset);  
    }

    
  })
 
}

  
  onSubmit() {
  
 
    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();
   
  
    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }


//passing id in assettype
let typee = this.assetty.filter((data: { type: any; }) => {
  if (data.type === this.form.value.type) {
    return data;
  }

})
console.log(typee);
this.form.value.type = typee[0].astt_id;

  //passing id in assetcategory
  let cat = this.assetcat.filter((data: { category: any; }) => {
    if (data.category === this.form.value.category) {
      return data;
    }
  
  })
  console.log(cat);
  this.form.value.category = cat[0].astc_id;


//passing id in assetgrop
let grp = this.assetgrop.filter((data: { astg_group: any; }) => {
  if (data.astg_group === this.form.value.astg_group) {
    return data;
  }

})
console.log(grp);
this.form.value.astg_group = grp[0].astg_id;

//passing id in make
let ma = this.mak.filter((data: { make: any; }) => {
  if (data.make === this.form.value.make) {
    return data;
  }

})
console.log(ma);
this.form.value.make = ma[0].astupmk_id;

 //passing id in model
 let mod = this.assetmod.filter((data: { model: any; }) => {
  if (data.model === this.form.value.model) {
    return data;
  }

})
console.log(mod);
this.form.value.model = mod[0].astupmod_id;


//passing id in custodian
let castod = this.custod.filter((data: { custodian: any; }) => {
  if (data.custodian === this.form.value.custodian) {
    return data;
  }

})
console.log(castod);
this.form.value.custodian = castod[0].astupct_id;

 //passing id in Asset owner
 let owne = this.owner.filter((data: { owner_name: any; }) => {
  if (data.owner_name === this.form.value.assetowner) {
    return data;
  }

})
console.log(owne);
this.form.value.assetowner = owne[0].user_id;

  //passing id in location
  let locat = this.loc.filter((data: { location: any; }) => {
    if (data.location === this.form.value.location) {
      return data;
    }
  
  })
  console.log(locat);
  this.form.value.location = locat[0].astuploc_id;

   //passing id in confidenciality
 let confi = this.confide.filter((data: { conf: any; }) => {
  if (data.conf === this.form.value.conf) {
    return data;
  }

})
console.log(confi);
this.form.value.conf = confi[0].astupc_id;

 //passing id in integrity
 let integr = this.integ.filter((data: { inte: any; }) => {
  if (data.inte === this.form.value.inte) {
    return data;
  }

})
console.log(integr);
this.form.value.inte = integr[0].astupi_id;

//passing id in availability
let availib = this.avail.filter((data: { avail: any; }) => {
  if (data.avail === this.form.value.avail) {
    return data;
  }

})
console.log(availib);
this.form.value.avail = availib[0].astupa_id;


//passing id in family
let fami = this.fam.filter((data: { family: any; }) => {
  if (data.family === this.form.value.family) {
    return data;
  }

})
console.log(fami);
this.form.value.family = fami[0].astupf_id;

 //passing id in status
 let sta = this.status.filter((data: { status: any; }) => {
  if (data.status === this.form.value.status) {
    return data;
  }

})
console.log(sta);
this.form.value.status = sta[0].asts_id;

    this.loading = true;
    console.log(this.form.value)
    debugger;
    this.updatechange();

  }

  
  updatechange() {
    
    this.assetservice.assetupdation(this.form.value)
      .subscribe(res => {

        this.loading = false;
        console.log(res);

         if (res.message) {
            this.router.navigate(['/home/users/assetlaptop']);
          this.alterservices.success('Asset updated', { autoClose: true, keepAfterRouteChange: true });
        }
        else {
          this.result1 = res;
          this.alterservices.success(res, { autoClose: true, keepAfterRouteChange: true });

        }

      },
        error => {
          this.loading = false;
          this.alterservices.error(error, { autoClose: true, keepAfterRouteChange: true });

        }
      );

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
    
      this.router.navigate(['/home/users/assetlaptop']);
    
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  //console.log('div App', e);
}
 
}




