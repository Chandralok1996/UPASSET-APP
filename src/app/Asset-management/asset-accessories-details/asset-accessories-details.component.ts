import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';
import { AccPdfComponent } from '../acc-pdf/acc-pdf.component';
import { DesktopPdfComponent } from '../desktop-pdf/desktop-pdf.component';


@Component({
  selector: 'app-asset-accessories-details',
  templateUrl: './asset-accessories-details.component.html',
  styleUrls: ['./asset-accessories-details.component.css']
})
export class AssetAccessoriesDetailsComponent implements OnInit {
  details: any;

  constructor(public route:ActivatedRoute,
    private router: Router,
    public assetService: AssetService,
    public dialog: MatDialog,) { }

  ngOnInit() {

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.getbyassetdetails1(assetid)
      console.log(assetid)
      //.then().catch(err => console.log(err));
    });

  }

  getbyassetdetails1(assetid){
    this.assetService.getbyassetdetailsAccesory(assetid)
        .subscribe(details => {
            this.details = details.rows;
            console.log(this.details)
        });

  }


  
  routeLink(){
    this.router.navigate(['/home/users/assetaccessories']);
}



openAttachment(astdid){
  this.assetService.astd_id = astdid;

  const dialogRef = this.dialog.open(AccPdfComponent, {
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



}

