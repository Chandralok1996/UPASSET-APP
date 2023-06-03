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
      console.log(assetid)
      //.then().catch(err => console.log(err));
    });
  }

  getbyassetdetails1(inid_id){
    this.incidentservice.incidentgetbyid(inid_id)
    .subscribe(details => {
        this.details = details.rows;
        this.details1 = details.rows;
        this.details = Array.of(this.details)
        this.pdfFiles = details.rows2;
        console.log(this.details)

        this.asset1 =details.rows1;
        this.asset1 = this.asset1.map(item => ({ data: `${item.created} - ${item.working_notes}\n` }));
        for (const iterator of this.asset1) {
          this.previousData.push(iterator.data)
        } 
         console.log(this.previousData)
    });

  }

  downloadPdf(pdfUrl: string, pdfName: string ) {
    FileSaver.saveAs(pdfUrl, pdfName);
  }

  openDoc(pdfUrl: string, startPage: number ) {
    window.open(pdfUrl + '#page=' + startPage, '_blank', '', true);
  }

  edit(){
    this.incidentservice.inid = this.details1.inid_id;
    console.log(this.incidentservice.inid)

    // const dialogRef = this.dialog.open(UpdateTicketComponent, {
    //   width: '653px',
    //   height: '500px',
    
    //   scrollStrategy: new NoopScrollStrategy(),
    //   position: {top:'7.9%'},
    // });
  
    // dialogRef.afterClosed().subscribe(result => {
    //   console.log('The dialog was closed');
    
    // });

    this.router.navigate(['home/users/updateticket/:'+ this.incidentservice.inid]);
  }

  routerPage(){
    // if(this.accountService.user.rolename === 'enduser'){
    //   this.router.navigate(['home/users/enduser']);

    // }else if(this.accountService.user.rolename === 'Administrator'){
    //   this.router.navigate(['home/users/incident']);
    // }else if(this.accountService.user.rolename === 'Helpdesk'){
    //   this.router.navigate(['home/users/coordinator']);
    // }else if(this.accountService.user.rolename === 'ITsupport'){
    //   this.router.navigate(['home/users/supuser']);
    // }
    this.location.back()

  }

}

