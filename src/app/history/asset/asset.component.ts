import { Component, HostListener, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-asset',
  templateUrl: './asset.component.html',
  styleUrls: ['./asset.component.css']
})
export class AssetComponent implements OnInit {

  form: any;
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
   (this.asset_name)
    this.userDetails = null;  
    this.userpastDetails =  null;
    this.assetService.getbyassetHistory(this.asset_name)
        .subscribe(details => {
         (details)
          this.assetDetails = details.current_ast;
          this.assetPastDetails = details.past_ast;            
        });
  }

   
  user(){
    this.assetDetails = null;
    this.assetPastDetails = null;
    // this.userDetails = null;  
    //  this.userpastDetails = null;
   (this.empid)
    this.assetService.getbyuserHistory(this.empid)
        .subscribe(details => {
         (details)
            this.userDetails = details.current_ast;  
            this.userpastDetails =  details.past_ast;
           (this.userpastDetails);   
        });
  }

  user1(data:any){
   (data);
    this.asset_name = data
   // this.assetDetails = null;
    this.userpastDetails = null;
    this.userDetails = null;
    this.assetService.getbyassetHistory(data)
        .subscribe(details => {
         (details)
            this.assetDetails = details.current_ast;  
            this.assetPastDetails =  details.past_ast;      
        });
  }


  user2(empid:any){
    this.empid = empid;
    this.assetDetails = null;
    this.assetPastDetails = null;
   (this.empid)
    this.assetService.getbyuserHistory(empid)
        .subscribe(details => {
         (details)
            this.userDetails = details.current_ast;  
            this.userpastDetails =  details.past_ast;
           (this.userpastDetails);   
        });
  }
  
  @HostListener('window:scroll', ['$event'])
  onScroll(e:any) {  
  }
  
   
  
  divScroll(e:any) {
  }
  
}
