import { Component, HostListener, Input, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-asset-sort',
  templateUrl: './asset-sort.component.html',
  styleUrls: ['./asset-sort.component.css']
})
export class AssetSortComponent implements OnInit {

  dropdownList = [];
dropdownSettings = {};
  
  priorityDropdownList = [];
  priorityDropdownSettings = {};

  products:any;
products1:any;

@Input() enduser={
  status:'',
  assetgroup:''
};

  constructor( public assetService: AssetService,
    private router: Router,
    public dialogRef: MatDialogRef<AssetSortComponent>) { }
    @HostListener('window:keyup.esc') onKeyUp() {
      this.dialogRef.close();
    }

  ngOnInit(): void {

    this.assetService.sortAssetGroup().subscribe((data: any[])=>{
      this.products = JSON.stringify(data);
      this.products = JSON.parse(this.products)
      this.priorityDropdownList = this.products.rows;
     (this.priorityDropdownList )
    }),
    this.assetService.sortstatus().subscribe((data: any[])=>{
     
      this.products1 = JSON.stringify(data);
      this.products1 = JSON.parse(this.products1);
      this.dropdownList =  this.products1.rows;
     (this.dropdownList )
     
      
   }),


    this.dropdownSettings = {
      singleSelection: false,
      idField: 'asts_id',
      textField: 'status',
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      itemsShowLimit: 3,
      allowSearchFilter: true
    };
  
    this.priorityDropdownSettings = {
      singleSelection: false,
      idField: 'astg_id',
      textField: 'astg_group',
      selectAllText: 'Select All',
      unSelectAllText: 'UnSelect All',
      itemsShowLimit: 3,
      allowSearchFilter: true
    }
  }

  
onItemSelect(item: any) {
 
  
}
onSelectAll(items: any) {
  
 
}
handleChange(){
 
}


onNoClick() {
  this.dialogRef.close();
}



submit(){
  this.assetService.enduser = this.enduser;
 (this.assetService.enduser);
 
        this.onNoClick();
     this.router.navigate(["/home/users/assetreport"]); 
}

}
