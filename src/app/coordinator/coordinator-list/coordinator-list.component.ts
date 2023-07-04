import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, HostListener, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { formatDate } from '@angular/common';
import { NewTicketUserComponent } from 'src/app/new-ticket-user/new-ticket-user.component';
import { SortComponent } from 'src/app/sort/sort.component';
import { UpdateTicketComponent } from 'src/app/update-ticket/update-ticket.component';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { IncidentService } from 'src/app/_services/incident.service';

@Component({
  selector: 'app-coordinator-list',
  templateUrl: './coordinator-list.component.html',
  styleUrls: ['./coordinator-list.component.css']
})
export class CoordinatorListComponent implements OnInit {
  data5:any;
  allTicket: any;
  allTicketSort: any;
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
  myTicket: any;
  openedby: any;
  myTicketCount: any;
  myTicketSort: any;
  unassignedTicket: any;
  unassignedTicketCount: any;
  closedTicket: any;
  closedTicketCount: any;
  unassigndeTicketSort: any;
  closedTicketSort: any;
  ownedby: any;
  myfilterData = 'Last 24 hours';
  filterCloseData = 'Last 24 hours';
  filterUnassingendData = 'Last 24 hours';
  filterAllData = 'Last 24 hours';

  form: any;
  loading = false;
  submitted = false;

  currentDate = new Date();
 cValue = formatDate(this.currentDate, 'yyyy-MM-dd', 'en-US');

  constructor(public dialog: MatDialog,
    private formBuilder: FormBuilder,
    public incidentservice: IncidentService,
    public accountService: AccountService,
    private router: Router,
    public alterservices: AlertService) { }

  ngOnInit(): void {
     this.openedby = this.accountService.user.userid;
     this.ownedby = this.accountService.user.userid;
     
    this.getallTicket(this.filterAllData);
    this.getmyTicket(this.myfilterData);
    this.getunassignedTicket(this.filterUnassingendData);
    this.getclosedTicket(this.filterCloseData);

    this.form = this.formBuilder.group({
      startDate:['',Validators.required],
      endDate:['',Validators.required]
  });

  this.form.patchValue({
    startDate: this.cValue,
    endDate:this.cValue
  })



  }


  get f() { return this.form.controls; }

  onSubmit(){

    this.submitted = true;

    // reset alerts on submit
    this.alterservices.clear();

    if(this.form.invalid) {
      return;
    }
    this.loading = true;
   (this.form.value)

    if(this.filterCloseData === 'Select date'){
      this.incidentservice.getCloseTicketDate(this.ownedby,this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.closedTicketSort = data.rows;
        this.closedTicket =  this.closedTicketSort;
        this.closedTicketCount = data.rowCount;
       (JSON.stringify(this.closedTicket) + ' '+ this.unassignedTicketCount)
       
      });

    }

    if(this.filterUnassingendData === 'Select date'){

      this.incidentservice.getUnassignedTicketDate(this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.unassigndeTicketSort = data.rows;
        this.unassignedTicket = this.unassigndeTicketSort;
        this.unassignedTicketCount = data.rowCount;
       
      });
        
    }

    if(this.filterAllData === 'Select date'){

      this.incidentservice.getAllTicketDate(this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.allTicketSort = data.rows
      this.allTicket =  this.allTicketSort;
      this.allTicketCount = data.rowCount;
    
       
      });
        
    }

    if(this.myfilterData === 'Select date'){

      this.incidentservice.getmyTicketDate(this.openedby,this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.myTicketSort= data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
       
      });
        
    }

  }

  

  @HostListener('window:scroll', ['$event'])
  onScroll(e:any) {
   //('window', e);
  }
  
   
  
  divScroll(e:any) {
   //('div App', e);
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
     ('The dialog was closed');
    //  this.animal = result;
    });

  }

  openDialog(): void {
    
    this.router.navigate(['/home/users/ticketcreation']);

}

getallTicket(event:any){
  const data = event.target ? (event.target as HTMLInputElement).value : event;
  this.filterAllData = data;

  if(this.filterAllData === 'Last 24 hours'){
    this.filterAllData = '1';
    this.incidentservice.getAllTicket(this.filterAllData).subscribe(data => {
      this.allTicketSort = data.rows
      this.allTicket =  this.allTicketSort;
      this.allTicketCount = data.rowCount;
     (this.allTicket)
     
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

getmyTicket(event:any){
  const data = event.target ? (event.target as HTMLInputElement).value : event;
    this.myfilterData = data
    if( this.myfilterData === 'Last 24 hours'){
      this.myfilterData = '1';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myTicketSort= data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
         ('my ticket'+this.myTicket)
      });
    }else if( this.myfilterData === 'Last 7 days'){
      this.myfilterData = '7';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myTicketSort= data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
         ('my ticket'+this.myTicket)
      });
    }else if( this.myfilterData === 'Last 30 days'){
      this.myfilterData = '30';
      this.incidentservice.getMyTicket(this.openedby,this.myfilterData)
      .subscribe(data => {
        this.myTicketSort= data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
         ('my ticket'+this.myTicket)
      });
    }


 

}

 

async applyFilter(event: any) {
  const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
  this.allTicket=this.allTicketSort;
  if(filterValue === ''){
      return this.getallTicket(this.filterAllData);
   }
   this.allTicket=this.allTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim())   
       )
 
  (this.allTicket);
    
}

async applyFilterMy(event: any) {
  const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
  this.myTicket= this.myTicketSort;
  if(filterValue === ''){
      return this.getmyTicket(this.myfilterData);
   }
   this.myTicket=this.myTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) 
       )
 

    
}

sortMyTicket(event:any) {
 
  const option = event.target ? (event.target as HTMLInputElement).value : event;

  let htol=[];
   if(option ===  'New'){
    this.myTicket= this.myTicketSort;
     for(let i=0;i<this.myTicket.length;i++){
       debugger;
         if(this.myTicket[i].status === 'New' && i!=this.myTicket.length){
             htol.push(this.myTicket[i])
         }
       }
       this.myTicket=htol;
       this.myTicketCount = this.myTicket.length;
   }
   if(option ===  'Assigned'){
    this.myTicket= this.myTicketSort;
       for(let i=0;i<this.myTicket.length;i++){
         if(this.myTicket[i].status === 'Assigned' && i!=this.myTicket.length){
           htol.push(this.myTicket[i])
       }
     }
     this.myTicket=htol;
     this.myTicketCount = this.myTicket.length;
    }
    if(option ===  'In progress'){
      this.myTicket= this.myTicketSort;
     for(let i=0;i<this.myTicket.length;i++){
       if(this.myTicket[i].status === 'In progress' && i!=this.myTicket.length){
         htol.push(this.myTicket[i])
     }
         
     
     }
    (htol)
     this.myTicket=htol;
     this.myTicketCount = this.myTicket.length;
    
   }
 
   if(option ===  'Pending customer'){
    this.myTicket= this.myTicketSort;
      for(let i=0;i<this.myTicket.length;i++){
          if(this.myTicket[i].status === 'Pending customer' && i!=this.myTicket.length){
              htol.push(this.myTicket[i])
          }
        }
        this.myTicket=htol;
        this.myTicketCount = this.myTicket.length;
   }
   if(option ===  'Pending vendor'){
    this.myTicket= this.myTicketSort;
        for(let i=0;i<this.myTicket.length;i++){
          if(this.myTicket[i].status === 'Pending vendor' && i!=this.myTicket.length){
            htol.push(this.myTicket[i])
        }
      }
      this.myTicket=htol;
      this.myTicketCount = this.myTicket.length;
    }

    if(option ===  'Resolved'){
      this.myTicket= this.myTicketSort;
      for(let i=0;i<this.myTicket.length;i++){
        if(this.myTicket[i].status === 'Resolved' && i!=this.myTicket.length){
          htol.push(this.myTicket[i])
      }     
     }
     (htol)
      this.myTicket=htol;
      this.myTicketCount = this.myTicket.length;
      
    }

    if(option ===  'Closed'){
      this.myTicket= this.myTicketSort;
      for(let i=0;i<this.myTicket.length;i++){
        if(this.myTicket[i].status === 'Closed' && i!=this.myTicket.length){
          htol.push(this.myTicket[i])
      }
    }
    this.myTicket=htol;
    this.myTicketCount = this.myTicket.length;
  }
 
   

       
       
     

}


 
sortallticket(event:any) {
  
  const option = event.target ? (event.target as HTMLInputElement).value : event;
 (option)
       let htol=[];
     if(option ===  'New'){
      this.allTicket =  this.allTicketSort;
       for(let i=0;i<this.allTicket.length;i++){
         debugger;
           if(this.allTicket[i].status === 'New' && i!=this.allTicket.length){
               htol.push(this.allTicket[i])
              
           }
         }
         this.allTicket=htol;
         this.allTicketCount = this.allTicket.length;
     }
     if(option ===  'Assigned'){
      this.allTicket =  this.allTicketSort;
         for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].status === 'Assigned' && i!=this.allTicket.length){
             htol.push(this.allTicket[i])
             
         }
       }
       this.allTicket=htol;
       this.allTicketCount = this.allTicket.length;
      }
  
      if(option ===  'In progress'){
        this.allTicket =  this.allTicketSort;
       for(let i=0;i<this.allTicket.length;i++){
         if(this.allTicket[i].status === 'In progress' && i!=this.allTicket.length){
           htol.push(this.allTicket[i])
           
       }   
      }
      (htol)
        this.allTicket=htol;
        this.allTicketCount = this.allTicket.length;  
     }
  
     if(option ===  'Pending customer'){
      this.allTicket =  this.allTicketSort;
         for(let i=0;i<this.allTicket.length;i++){
           if(this.allTicket[i].status === 'Pending customer' && i!=this.allTicket.length){
             htol.push(this.allTicket[i])
             
         }
       }
       this.allTicket=htol;
       this.allTicketCount = this.allTicket.length;
      }
  
      if(option ===  'Pending vendor'){
        this.allTicket =  this.allTicketSort;
           for(let i=0;i<this.allTicket.length;i++){
             if(this.allTicket[i].status === 'Pending vendor' && i!=this.allTicket.length){
               htol.push(this.allTicket[i])
               
           }
         }
         this.allTicket=htol;
         this.allTicketCount = this.allTicket.length;
        }
  
        if(option ===  'Resolved'){
          this.allTicket =  this.allTicketSort;
             for(let i=0;i<this.allTicket.length;i++){
               if(this.allTicket[i].status === 'Resolved' && i!=this.allTicket.length){
                 htol.push(this.allTicket[i])
                 
             }
           }
           this.allTicket=htol;
           this.allTicketCount = this.allTicket.length;
          }
  
          if(option ===  'Closed'){
            this.allTicket =  this.allTicketSort;
               for(let i=0;i<this.allTicket.length;i++){
                 if(this.allTicket[i].status === 'Closed' && i!=this.allTicket.length){
                   htol.push(this.allTicket[i])
                   
               }
             }
             this.allTicket=htol;
             this.allTicketCount = this.allTicket.length;
            }
   
  }

getItems(data:any){

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
    position: {top:'7.9%'},
   

  });

  dialogRef.afterClosed().subscribe(result => {
    this.getallTicket(this.filterAllData);
    this.getmyTicket(this.myfilterData);
   ('The dialog was closed');
  //  this.animal = result;
  });
}

getunassignedTicket(event:any){
  const data = event.target ? (event.target as HTMLInputElement).value : event;
  this.filterUnassingendData = data;

  if(this.filterUnassingendData === 'Last 24 hours'){
    this.filterUnassingendData = '1'
    this.incidentservice.getunassignedTicket(this.filterUnassingendData)
    .subscribe(data => {
      this.unassigndeTicketSort = data.rows;
        this.unassignedTicket = this.unassigndeTicketSort;
        this.unassignedTicketCount = data.rowCount;
       ('my ticket'+this.unassignedTicketCount)
    });
  }else  if(this.filterUnassingendData === 'Last 7 days'){
    this.filterUnassingendData = '7'
    this.incidentservice.getunassignedTicket(this.filterUnassingendData)
    .subscribe(data => {
      this.unassigndeTicketSort = data.rows;
        this.unassignedTicket = this.unassigndeTicketSort;
        this.unassignedTicketCount = data.rowCount;
       ('my ticket'+this.unassignedTicketCount)
    });
  }else  if(this.filterUnassingendData === 'Last 30 days'){
    this.filterUnassingendData = '30'
    this.incidentservice.getunassignedTicket(this.filterUnassingendData)
    .subscribe(data => {
      this.unassigndeTicketSort = data.rows;
        this.unassignedTicket = this.unassigndeTicketSort;
        this.unassignedTicketCount = data.rowCount;
       ('my ticket'+this.unassignedTicketCount)
    });
  }
 

}

async applyFilterunAssigned(event: any) {
  const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
  this.unassignedTicket=this.unassigndeTicketSort;
  if(filterValue === ''){
      return this.getunassignedTicket(this.filterUnassingendData);
   }
   this.unassignedTicket=this.unassignedTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) 
       )
 
  (this.unassignedTicket);
    
}

getclosedTicket(event:any){
  const data = event.target ? (event.target as HTMLInputElement).value : event;
   this.filterCloseData = data;
 
  if(this.filterCloseData === 'Last 24 hours'){
      this.filterCloseData = '1';
      this.incidentservice.getclosedTicketDays(this.filterCloseData)
      .subscribe(data => {
        this.closedTicketSort = data.rows;
          this.closedTicket =  this.closedTicketSort;
          this.closedTicketCount = data.rowCount;
         ('my ticket'+JSON.stringify(this.closedTicket))
      });    

  }else  if(this.filterCloseData === 'Last 7 days'){
    this.filterCloseData = '7';
    this.incidentservice.getclosedTicketDays(this.filterCloseData)
    .subscribe(data => {
      this.closedTicketSort = data.rows;
        this.closedTicket =  this.closedTicketSort;
        this.closedTicketCount = data.rowCount;
       ('close ticket'+JSON.stringify(this.closedTicket))
    });    

}else if(this.filterCloseData === 'Last 30 days'){
  this.filterCloseData = '30';
  this.incidentservice.getclosedTicketDays(this.filterCloseData)
  .subscribe(data => {
    this.closedTicketSort = data.rows;
      this.closedTicket =  this.closedTicketSort;
      this.closedTicketCount = data.rowCount;
     ('close ticket'+JSON.stringify(this.closedTicket))
  });    

}

 
}

async applyFilterClosed(event: any) {
  const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
  this.closedTicket=this.closedTicketSort;
  if(filterValue === ''){
      return this.getclosedTicket(this.filterCloseData);
   }
   this.closedTicket=this.closedTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) 
       )
 
  (this.closedTicket);
    
}

sortunAssignedTicket(event:any) {
  const option = event.target ? (event.target as HTMLInputElement).value : event;
  let htol=[];
  if(option ===  'New'){
   this.unassignedTicket = this.unassigndeTicketSort;
    for(let i=0;i<this.unassignedTicket.length;i++){    
        if(this.unassignedTicket[i].status === 'New' && i!=this.unassignedTicket.length){
            htol.push(this.unassignedTicket[i])
        }
      }
      this.unassignedTicket=htol;
      this.unassignedTicketCount =  this.unassignedTicket.length;
     }

     if(option ===  'Assigned'){
       this.unassignedTicket = this.unassigndeTicketSort;
      for(let i=0;i<this.unassignedTicket.length;i++){
        if(this.unassignedTicket[i].status === 'Assigned' && i!=this.unassignedTicket.length){
          htol.push(this.unassignedTicket[i])
      }
    }
    this.unassignedTicket=htol;
    this.unassignedTicketCount =  this.unassignedTicket.length;
   }

   if(option ===  'In progress'){
     this.unassignedTicket = this.unassigndeTicketSort;
    for(let i=0;i<this.unassignedTicket.length;i++){
      if(this.unassignedTicket[i].status === 'In progress' && i!=this.unassignedTicket.length){
        htol.push(this.unassignedTicket[i])
    }
  }    
   (htol)
    this.unassignedTicket=htol;
    this.unassignedTicketCount =  this.unassignedTicket.length;
  }

  if(option ===  'Pending customer'){
   this.unassignedTicket = this.unassigndeTicketSort;
     for(let i=0;i<this.unassignedTicket.length;i++){
         if(this.unassignedTicket[i].status === 'Pending customer' && i!=this.unassignedTicket.length){
             htol.push(this.unassignedTicket[i])
         }
       }
       this.unassignedTicket=htol;
       this.unassignedTicketCount =  this.unassignedTicket.length;
  }

  if(option ===  'Pending vendor'){
   this.unassignedTicket = this.unassigndeTicketSort;
       for(let i=0;i<this.unassignedTicket.length;i++){
         if(this.unassignedTicket[i].status === 'Pending vendor' && i!=this.unassignedTicket.length){
           htol.push(this.unassignedTicket[i])
       }
     }
     this.unassignedTicket=htol;
     this.unassignedTicketCount =  this.unassignedTicket.length;
  }

  if(option ===  'Resolved'){
   this.unassignedTicket = this.unassigndeTicketSort;
     for(let i=0;i<this.unassignedTicket.length;i++){
       if(this.unassignedTicket[i].status === 'Resolved' && i!=this.unassignedTicket.length){
         htol.push(this.unassignedTicket[i])
     }
         
     
     }
     
     this.unassignedTicket=htol;
     this.unassignedTicketCount =  this.unassignedTicket.length;
     
   }
   if(option ===  'Closed'){
     this.unassignedTicket = this.unassigndeTicketSort;
       for(let i=0;i<this.unassignedTicket.length;i++){
         if(this.unassignedTicket[i].status === 'Closed' && i!=this.unassignedTicket.length){
           htol.push(this.unassignedTicket[i])
       }
           
       
       }
  
       this.unassignedTicket=htol;
       this.unassignedTicketCount =  this.unassignedTicket.length;
       
     }
 
}


sortClosedTicket(event:any) {
  const option = event.target ? (event.target as HTMLInputElement).value : event;
 
  let htol=[];
  if(option ===  'New'){
   this.closedTicket =  this.closedTicketSort;
    for(let i=0;i<this.closedTicket.length;i++){
        if(this.closedTicket[i].status === 'New' && i!=this.closedTicket.length){
            htol.push(this.closedTicket[i])
        }
      }
      this.closedTicket=htol;
      this.closedTicketCount = this.closedTicket.length;
     }
     if(option ===  'Assigned'){
       this.closedTicket =  this.closedTicketSort;
      for(let i=0;i<this.closedTicket.length;i++){
        if(this.closedTicket[i].status === 'Assigned' && i!=this.closedTicket.length){
          htol.push(this.closedTicket[i])
      }
    }
    this.closedTicket=htol;
    this.closedTicketCount = this.closedTicket.length;
   }
   if(option ===  'In progress'){
     this.closedTicket =  this.closedTicketSort;
    for(let i=0;i<this.closedTicket.length;i++){
      if(this.closedTicket[i].status === 'In progress' && i!=this.closedTicket.length){
        htol.push(this.closedTicket[i])
    }
        
    
    }
    this.closedTicket=htol;
    this.closedTicketCount = this.closedTicket.length;
   
  }

  if(option ===  'Pending customer'){
   this.closedTicket =  this.closedTicketSort;
     for(let i=0;i<this.closedTicket.length;i++){
         if(this.closedTicket[i].status === 'Pending customer' && i!=this.closedTicket.length){
             htol.push(this.closedTicket[i])
         }
       }
       this.closedTicket=htol;
       this.closedTicketCount = this.closedTicket.length;
     }
     if(option ===  'Pending vendor'){
       this.closedTicket =  this.closedTicketSort;
       for(let i=0;i<this.closedTicket.length;i++){
         if(this.closedTicket[i].status === 'Pending vendor' && i!=this.closedTicket.length){
           htol.push(this.closedTicket[i])
       }
     }
     this.closedTicket=htol;
     this.closedTicketCount = this.closedTicket.length;
     }
     if(option ===  'Resolved'){
       this.closedTicket =  this.closedTicketSort;
     for(let i=0;i<this.closedTicket.length;i++){
       if(this.closedTicket[i].status === 'Resolved' && i!=this.closedTicket.length){
         htol.push(this.closedTicket[i])
     }
         
     
     }
     this.closedTicket=htol;
     this.closedTicketCount = this.closedTicket.length;
     
   }
   if(option ===  'Closed'){
     this.closedTicket =  this.closedTicketSort;
     for(let i=0;i<this.closedTicket.length;i++){
       if(this.closedTicket[i].status === 'Closed' && i!=this.closedTicket.length){
         htol.push(this.closedTicket[i])
     }      
     }
     this.closedTicket=htol;
     this.closedTicketCount = this.closedTicket.length;    
   }

 
}




}
