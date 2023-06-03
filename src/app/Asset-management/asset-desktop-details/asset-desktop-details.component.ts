import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';
// import * as jsPDF from 'jspdf';

import { MatDialog } from '@angular/material/dialog';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { DesktopPdfComponent } from '../desktop-pdf/desktop-pdf.component';
import { FormGroup } from '@angular/forms';

@Component({
  selector: 'app-asset-desktop-details',
  templateUrl: './asset-desktop-details.component.html',
  styleUrls: ['./asset-desktop-details.component.css']
})
export class AssetDesktopDetailsComponent implements OnInit {
  @ViewChild('content') content: ElementRef;
  details: any;
  
 

  constructor(public route:ActivatedRoute,
    public assetService: AssetService,
    public dialog: MatDialog,
    public router : Router) { }

  ngOnInit() {

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.getbyassetdetails1(assetid)
      console.log(assetid)
      //.then().catch(err => console.log(err));
    });

  }

  getbyassetdetails1(astd_id){
    this.assetService.getbyasset(astd_id)
        .subscribe(details => {
          console.log(details)
            this.details = details.rows;
           
        });

  }


  openAttachment(astdid){
    this.assetService.astd_id = astdid;
  
    const dialogRef = this.dialog.open(DesktopPdfComponent, {
      width: '800px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.7%'}
  
    });
  
    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    });
  
  }

  
  @HostListener('window:scroll', ['$event'])
  onScroll(e) {
   // console.log('window', e);
  }
  
   
  
  divScroll(e) {
   // console.log('div App', e);
  } 

  
  
  // routeLink(){
  //   if(this.details[0].astg_group === 'LAPTOP'){
  //     this.router.navigate(['/home/users/assetlaptop']);
  //   }else(this.details[0].astg_group === 'DESKTOP')
  //   {
  //     this.router.navigate(['/home/users/assetdekstop']);
  //   }
  // }

}

