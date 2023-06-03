import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';

@Component({
  selector: 'app-server-pdp',
  templateUrl: './server-pdp.component.html',
  styleUrls: ['./server-pdp.component.css']
})
export class ServerPdpComponent implements OnInit {
  details: any;

  constructor(public route:ActivatedRoute,
    public assetService: AssetService) { }

  ngOnInit() {

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.getbyassetdetails1(assetid)
      console.log(assetid)
      //.then().catch(err => console.log(err));
    });

  }

  getbyassetdetails1(assetid){
    this.assetService.getbyassetserverdetails(assetid)
        .subscribe(details => {
            this.details = details.rows;
            console.log(this.details)
        });

  }

}

