import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-asset-monitor-details',
  templateUrl: './asset-monitor-details.component.html',
  styleUrls: ['./asset-monitor-details.component.css']
})
export class AssetMonitorDetailsComponent implements OnInit {
  details: any;

  constructor(public route:ActivatedRoute,
    public assetService: AssetService,
    private router:Router) { }

  ngOnInit() {

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.getbyassetdetails1(assetid)
     
      //.then().catch(err =>(err));
    });

  }

  getbyassetdetails1(assetid:any){
    this.assetService.getbyassetdetailsMonitor(assetid)
        .subscribe(details => {
            this.details = details.rows;
           (this.details)
        });

  }

  routeLink(){
    this.router.navigate(['/home/users/assetmonitor']);
}

}
