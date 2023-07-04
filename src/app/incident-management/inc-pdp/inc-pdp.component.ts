import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { UpdateTicketComponent } from 'src/app/update-ticket/update-ticket.component';
import { AccountService } from 'src/app/_services/account.service';
import { IncidentService } from 'src/app/_services/incident.service';

import { Location } from '@angular/common'
declare var require: any;
const FileSaver = require('file-saver');

@Component({
  selector: 'app-inc-pdp',
  templateUrl: './inc-pdp.component.html',
  styleUrls: ['./inc-pdp.component.css']
})
export class IncPdpComponent implements OnInit {
  details: any;
  pdfFiles:any;
  details1: any;
  asset1: any;
  previousData :any = []; 


  constructor(public route:ActivatedRoute,
    public incidentservice: IncidentService,
    public dialog: MatDialog,
    public accountService: AccountService,
    private router: Router,
    private location: Location
    ) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.getbyassetdetails1(assetid)
    
      //.then().catch(err =>(err));
    });
  }

  getbyassetdetails1(inid_id:any){
    this.incidentservice.incidentgetbyid(inid_id)
    .subscribe(details => {
        this.details = details.rows;
        this.details1 = details.rows;
        this.details = Array.of(this.details)
        this.pdfFiles = details.rows2;
       (this.details)

        this.asset1 =details.rows1;
        this.asset1 = this.asset1.map((item:any) => ({ data: `${item.created} - ${item.working_notes}\n` }));
        for (const iterator of this.asset1) {
          this.previousData.push(iterator.data)
        } 
        (this.previousData)
    });

  }

  downloadPdf(pdfUrl: string, pdfName: string ) {
    FileSaver.saveAs(pdfUrl, pdfName);
  }

  openDoc(pdfUrl: string, startPage: number ) {
    window.open(pdfUrl + '#page=' + startPage, '_blank');
  }

  edit(){
    this.incidentservice.inid = this.details1.inid_id;
   (this.incidentservice.inid)
    this.router.navigate(['home/users/updateticket/:'+ this.incidentservice.inid]);
  }

  routerPage(){
    this.location.back()

  }

}

