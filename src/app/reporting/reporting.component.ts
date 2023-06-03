import { HttpClient } from '@angular/common/http';
import { Component, HostListener, Inject, NgZone, OnInit, PLATFORM_ID } from '@angular/core';
import { userdataCount } from '../_models';
import { AccountService } from '../_services/account.service';
import { IncidentService } from '../_services/incident.service';
import { Chart } from 'chart.js';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-reporting',
  templateUrl: './reporting.component.html',
  styleUrls: ['./reporting.component.css']
})
export class ReportingComponent implements OnInit {
 
  excel = [];
  allTicketSort: any;
  allTicket: any;
  selected1=[ 
     
    'New',
    'Assigned',
    'In progress',
    'Pending customer',
    'Pending vendor',
    'Resolved',
    'Closed'
  ];
  allTicketCount: any;
 

  constructor(  public accountService: AccountService,
    public incidentservice: IncidentService,
    private httpClient: HttpClient,
    public router:Router, public dialog: MatDialog,
  ) { }

  ngOnInit(): void {
    
   this.getallTicket();
  
  }

  graph(){
    this.incidentservice.graph(this.incidentservice.enduser).subscribe(
      result=>{
     
    console.log(result.rows);
    this.incidentservice.graphData = result.rows; 
    
    })
  }

  openGraph(){

    this.router.navigate(['home/users/graph']);

  }
 
  exportAsXLSX(): void {
    this.incidentservice.exportAsExcelFile(this.excel, 'sample');
  }

  getallTicket(){
    this.incidentservice.reporting(this.incidentservice.enduser).subscribe(data => {
      this.allTicketSort = data.rows;
      console.log(data.rows)
      this.excel=data.rows;
      this.allTicket =  this.allTicketSort ;
      this.allTicketCount = data.rowCount;
     
    });

  }

  async applyFilter(filterValue: string) {
    this.allTicket=this.allTicketSort;
    if(filterValue === ''){
        return this.getallTicket();
     }
     this.allTicket=this.allTicket.filter(filteredData =>
      filteredData.ticket_no.includes(filterValue.toUpperCase().trim()) ||
         filteredData.emp_name.toUpperCase().includes(filterValue.toUpperCase().trim()) 
         )
   
     console.log(this.allTicket);




    // this.allTicket=this.allTicketSort;
    // if(filterValue === ''){
    //     return this.getallTicket();
    //  }
    //  this.allTicket=this.allTicket.filter(filteredData =>
    //      filteredData.inid_id.includes(filterValue.toUpperCase().trim())
    //       ||
    //      filteredData.emp_name.includes(filterValue.toUpperCase().trim())
    //      )
   
    
      
  }

  onCitySelect(option:string) {
   console.log(option);
    let htol=[];
    if(option ===  'New'){
     this.allTicket= this.allTicketSort;
      for(let i=0;i<this.allTicket.length;i++){
        debugger;
          if(this.allTicket[i].call_status === 'New' && i!=this.allTicket.length){
              htol.push(this.allTicket[i])
          }
        }
        this.allTicket=htol;
        this.allTicketCount = this.allTicket.length;
    }
    if(option ===  'Assigned'){
     this.allTicket= this.allTicketSort;
        for(let i=0;i<this.allTicket.length;i++){
          if(this.allTicket[i].call_status === 'Assigned' && i!=this.allTicket.length){
            htol.push(this.allTicket[i])
        }
      }
      this.allTicket=htol;
      this.allTicketCount = this.allTicket.length;
     }
     if(option ===  'In progress'){
       this.allTicket= this.allTicketSort;
      for(let i=0;i<this.allTicket.length;i++){
        if(this.allTicket[i].call_status === 'In progress' && i!=this.allTicket.length){
          htol.push(this.allTicket[i])
      }
          
      
      }
      console.log(htol)
      this.allTicket=htol;
      this.allTicketCount = this.allTicket.length;
     
    }
  
    if(option ===  'Pending customer'){
     this.allTicket= this.allTicketSort;
       for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].call_status === 'Pending customer' && i!=this.allTicket.length){
               htol.push(this.allTicket[i])
           }
         }
         this.allTicket=htol;
         this.allTicketCount = this.allTicket.length;
    }
    if(option ===  'Pending vendor'){
     this.allTicket= this.allTicketSort;
         for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].call_status === 'Pending vendor' && i!=this.allTicket.length){
             htol.push(this.allTicket[i])
         }
       }
       this.allTicket=htol;
       this.allTicketCount = this.allTicket.length;
     }
 
     if(option ===  'Resolved'){
       this.allTicket= this.allTicketSort;
       for(let i=0;i<this.allTicket.length;i++){
         if(this.allTicket[i].call_status === 'Resolved' && i!=this.allTicket.length){
           htol.push(this.allTicket[i])
       }     
      }
       console.log(htol)
       this.allTicket=htol;
       this.allTicketCount = this.allTicket.length;
       
     }
 
     if(option ===  'Closed'){
       this.allTicket= this.allTicketSort;
       for(let i=0;i<this.allTicket.length;i++){
         if(this.allTicket[i].call_status === 'Closed' && i!=this.allTicket.length){
           htol.push(this.allTicket[i])
       }
     }
     this.allTicket=htol;
     this.allTicketCount = this.allTicket.length;
   }
  

}
  getItems(ticket){
    
  }


 



  routerPage(){
    if(this.accountService.user.rolename === 'enduser'){
      this.router.navigate(['home/users/enduser']);

    }else if(this.accountService.user.rolename === 'Administrator'){
      this.router.navigate(['home/users/incident']);
    }else if(this.accountService.user.rolename === 'Helpdesk'){
      this.router.navigate(['home/users/coordinator']);
    }else if(this.accountService.user.rolename === 'ITsupport'){
      this.router.navigate(['home/users/supuser']);
    }
  }

  
@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  //console.log('div App', e);
}


}
