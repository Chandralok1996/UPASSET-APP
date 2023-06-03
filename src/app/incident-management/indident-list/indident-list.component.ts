import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { HostListener } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { NewTicketUserComponent } from 'src/app/new-ticket-user/new-ticket-user.component';
import { NewTicketComponent } from 'src/app/new-ticket/new-ticket.component';
import { SortComponent } from 'src/app/sort/sort.component';
import { UpdateTicketComponent } from 'src/app/update-ticket/update-ticket.component';
import { AccountService } from 'src/app/_services/account.service';
import { IncidentService } from 'src/app/_services/incident.service';
import { FilterComponent } from '../filter/filter.component';

@Component({
  selector: 'app-indident-list',
  templateUrl: './indident-list.component.html',
  styleUrls: ['./indident-list.component.css']
})
export class IndidentListComponent implements OnInit {
  data5:any;
  allTicket: any;
  allTicketSort: any;
  selected=[ 
    
    'High to Low',
    
    
    'Low to High'
    
  ];
  myTicket: any;
  myTicketCount: any;
  openedby: any;
  myticketsort: any;
  allTicketCount: any;
  myfilterData = 'Last 24 hours';
  filterAllData = 'Last 24 hours';



  constructor( public dialog: MatDialog, 
    public accountService: AccountService,
      public incidentservice: IncidentService, ) { }

  ngOnInit(): void {

  this.openedby = this.accountService.user.userid;
  this.getallTicket(this.filterAllData);
  this.getmyTicket(this.myfilterData);


   
  }

  getallTicket(data){
    this.filterAllData = data;
  
    if(this.filterAllData === 'Last 24 hours'){
      this.filterAllData = '1';
      this.incidentservice.getAllTicket(this.filterAllData).subscribe(data => {
        this.allTicketSort = data.rows
        this.allTicket =  this.allTicketSort;
        this.allTicketCount = data.rowCount;
       
      });
    
    }else  if(this.filterAllData === 'Last 7 days'){
      this.filterAllData = '7';
      this.incidentservice.getAllTicket(this.filterAllData).subscribe(data => {
        this.allTicketSort = data.rows
        this.allTicket =  this.allTicketSort;
        this.allTicketCount = data.rowCount;
       
      });
    
    }else  if(this.filterAllData === 'Last 30 days'){
      this.filterAllData = '30';
      this.incidentservice.getAllTicket(this.filterAllData).subscribe(data => {
        this.allTicketSort = data.rows
        this.allTicket =  this.allTicketSort;
        this.allTicketCount = data.rowCount;
       
      });
    }
  }

  getmyTicket(data){
    this.myfilterData = data
    if( this.myfilterData === 'Last 24 hours'){
      this.myfilterData = '1';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myticketsort= data.rows;
          this.myTicket = this.myticketsort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicket)
      });
    }else if( this.myfilterData === 'Last 7 days'){
      this.myfilterData = '7';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myticketsort= data.rows;
          this.myTicket = this.myticketsort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicket)
      });
    }else if( this.myfilterData === 'Last 30 days'){
      this.myfilterData = '30';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myticketsort= data.rows;
          this.myTicket = this.myticketsort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicket)
      });
    }


 

}

  async applyFilter(filterValue: string) {
    this.allTicket=this.allTicketSort;
    if(filterValue === ''){
        return this.getallTicket(this.filterAllData);
     }
     this.allTicket=this.allTicket.filter(filteredData =>
      filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
         filteredData.inid_id.includes(filterValue.toUpperCase().trim()))
   
     console.log(this.allTicket);
      
  }

  async applyFilterMyTicket(filterValue: string) {
    this.myTicket=this.myticketsort;
    if(filterValue === ''){
        return this.getmyTicket(this.filterAllData);
     }
     this.myTicket=this.myTicket.filter(filteredData =>
      filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
         filteredData.inid_id.includes(filterValue.toUpperCase().trim()))
   
     console.log(this.myTicket);
      
  }

  

  openFilter(): void {
    const dialogRef = this.dialog.open(SortComponent, {
      width: '653px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.6%'}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    //  this.animal = result;
    });
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(NewTicketUserComponent, {
      width: '653px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.9%'}

    });

    dialogRef.afterClosed().subscribe(result => {
      this.getallTicket(this.myfilterData);
      this.getmyTicket(this.myfilterData);
      console.log('The dialog was closed');
   
    });


  }



  

  sortAllTicket(option:string) {
 
    let htol=[];
    if(option ===  'High to Low'){
    
      for(let i=0;i<this.allTicket.length;i++){
        debugger;
          if(this.allTicket[i].priority === 'High' && i!=this.allTicket.length){
              htol.push(this.allTicket[i])
          }
        }
        for(let i=0;i<this.allTicket.length;i++){
          if(this.allTicket[i].priority === 'Medium' && i!=this.allTicket.length){
            htol.push(this.allTicket[i])
        }
      }
      for(let i=0;i<this.allTicket.length;i++){
        if(this.allTicket[i].priority === 'Low' && i!=this.allTicket.length){
          htol.push(this.allTicket[i])
      }
          
      
      }
      console.log(htol)
      this.allTicket=htol;
     
    }
  
    if(option ===  'Low to High'){
     
       for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].priority === 'Low' && i!=this.allTicket.length){
               htol.push(this.allTicket[i])
           }
         }
         for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].priority === 'Medium' && i!=this.allTicket.length){
             htol.push(this.allTicket[i])
         }
       }
       for(let i=0;i<this.allTicket.length;i++){
         if(this.allTicket[i].priority === 'High' && i!=this.allTicket.length){
           htol.push(this.allTicket[i])
       }
           
       
       }
       console.log(htol)
       this.allTicket=htol;
       
     }
 
   
        
        
   
  }

  sortMyTicket(option:string) {
 
    let htol=[];
   if(option ===  'High to Low'){
   
     for(let i=0;i<this.myTicket.length;i++){
       debugger;
         if(this.myTicket[i].priority === 'High' && i!=this.myTicket.length){
             htol.push(this.myTicket[i])
         }
       }
       for(let i=0;i<this.myTicket.length;i++){
         if(this.myTicket[i].priority === 'Medium' && i!=this.myTicket.length){
           htol.push(this.myTicket[i])
       }
     }
     for(let i=0;i<this.myTicket.length;i++){
       if(this.myTicket[i].priority === 'Low' && i!=this.myTicket.length){
         htol.push(this.myTicket[i])
     }
         
     
     }
     console.log(htol)
     this.myTicket=htol;
    
   }
 
   if(option ===  'Low to High'){
    
      for(let i=0;i<this.myTicket.length;i++){
          if(this.myTicket[i].priority === 'Low' && i!=this.myTicket.length){
              htol.push(this.myTicket[i])
          }
        }
        for(let i=0;i<this.myTicket.length;i++){
          if(this.myTicket[i].priority === 'Medium' && i!=this.myTicket.length){
            htol.push(this.myTicket[i])
        }
      }
      for(let i=0;i<this.myTicket.length;i++){
        if(this.myTicket[i].priority === 'High' && i!=this.myTicket.length){
          htol.push(this.myTicket[i])
      }
          
      
      }
      console.log(htol)
      this.myTicket=htol;
      
    }
   
  }

getItems(data){

  this.incidentservice.inid = data.inid_id;
  console.log(this.incidentservice.inid)
          this.incidentUpdate();
  }
  
  incidentUpdate(): void {
    const dialogRef = this.dialog.open(UpdateTicketComponent, {
      width: '653px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.9%'}
  
    });
  
    dialogRef.afterClosed().subscribe(result => {
      this.getallTicket(this.myfilterData);
      this.getmyTicket(this.myfilterData);
      console.log('The dialog was closed');
    //  this.animal = result;
    });
  }





@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
 // console.log('div App', e);
}



  
}
