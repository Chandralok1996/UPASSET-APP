import { Component, HostListener, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-asset',
  templateUrl: './asset.component.html',
  styleUrls: ['./asset.component.css']
})
export class AssetComponent implements OnInit {

  form: FormGroup;
  asset_name: any;
  empid: any;
  assetDetails: any;
  userDetails: any;
  type: any;
  options: any;
  userpastDetails: any;
  assetPastDetails: any;
 

  constructor( public assetService: AssetService,) { }

  ngOnInit(): void {
  }

  
  asset(){
    console.log(this.asset_name)
    this.userDetails = null;  
    this.userpastDetails =  null;
    this.assetService.getbyassetHistory(this.asset_name)
        .subscribe(details => {
          console.log(details)
          this.assetDetails = details.current_ast;
          this.assetPastDetails = details.past_ast;            
        });
  }

   
  user(){
    this.assetDetails = null;
    this.assetPastDetails = null;
    // this.userDetails = null;  
    //  this.userpastDetails = null;
    console.log(this.empid)
    this.assetService.getbyuserHistory(this.empid)
        .subscribe(details => {
          console.log(details)
            this.userDetails = details.current_ast;  
            this.userpastDetails =  details.past_ast;
            console.log(this.userpastDetails);   
        });
  }

  user1(data){
    console.log(data);
    this.asset_name = data
   // this.assetDetails = null;
    this.userpastDetails = null;
    this.userDetails = null;
    this.assetService.getbyassetHistory(data)
        .subscribe(details => {
          console.log(details)
            this.assetDetails = details.current_ast;  
            this.assetPastDetails =  details.past_ast;      
        });
  }


  user2(empid){
    this.empid = empid;
    this.assetDetails = null;
    this.assetPastDetails = null;
    console.log(this.empid)
    this.assetService.getbyuserHistory(empid)
        .subscribe(details => {
          console.log(details)
            this.userDetails = details.current_ast;  
            this.userpastDetails =  details.past_ast;
            console.log(this.userpastDetails);   
        });
  }
  
  @HostListener('window:scroll', ['$event'])
  onScroll(e) {  
  }
  
   
  
  divScroll(e) {
  }
  
}
