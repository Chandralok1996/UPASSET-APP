
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { HostListener } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { formatDate } from '@angular/common';
import { FilterComponent } from 'src/app/incident-management/filter/filter.component';
import { NewTicketUserComponent } from 'src/app/new-ticket-user/new-ticket-user.component';
import { NewTicketComponent } from 'src/app/new-ticket/new-ticket.component';
import { UpdateTicketComponent } from 'src/app/update-ticket/update-ticket.component';
import { AlertService } from 'src/app/_services';
import { AccountService } from 'src/app/_services/account.service';
import { IncidentService } from 'src/app/_services/incident.service';


@Component({
  selector: 'app-support-list',
  templateUrl:'./support-list.component.html',
  styleUrls: ['./support-list.component.css']
})
export class SupportListComponent implements OnInit {
  data5:any;

  allTicketCount: any;
  myTicket: any;
  openedby: any;
  myTicketCount: any;
  assignedTicket: any;
  assignedTicketCount: any;
  ownedby: any;
  unassignedTicket: any;
  unassignedTicketCount: any;
  closedTicket: any;
  closedTicketCount: any;
  assigndeTicketSort: any;
  unassigndeTicketSort: any;
  closedTicketSort: any;
  myTicketSort: any;
  selected1=[ 
    'New',
    'Assigned',
    'In progress',
    'Pending customer',
    'Pending vendor',
    'Resolved',
    'Closed' 
  ];
  filterCloseData = 'Last 24 hours';
  filterAssignData = 'Last 24 hours';

  form: any;
  loading = false;
  submitted = false;

  currentDate = new Date();
  cValue = formatDate(this.currentDate, 'yyyy-MM-dd', 'en-US');
 

  constructor( public dialog: MatDialog,
    private formBuilder: FormBuilder,
    public incidentservice: IncidentService,
    public accountService: AccountService,
    public alterservices: AlertService,) { }

  ngOnInit(): void {
    this.openedby = this.accountService.user.userid;
    this.ownedby = this.accountService.user.userid;
    // this.getunassignedTicket();
    // this.getmyTicket();
    this.getassignedTicket(this.filterAssignData);
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
       
      });

    }

    if(this.filterAssignData === 'Select date'){
      this.incidentservice.geAssignTicketDate(this.ownedby,this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.assigndeTicketSort = data.rows
        this.assignedTicket = this.assigndeTicketSort;
        this.assignedTicketCount = data.rowCount;
       
      });
        
    }

  }

  

  openFilter(): void {
    const dialogRef = this.dialog.open(FilterComponent, {
      width: '653px',
      height: '350px',
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
    const dialogRef = this.dialog.open(NewTicketUserComponent, {
      width: '653px',
      height: '500px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      position: {top:'7.9%'}

    });

    dialogRef.afterClosed().subscribe(result => {
    //  this.getunassignedTicket();
     // this.getmyTicket();
      this.getassignedTicket(this.filterAssignData);
      this.getclosedTicket(this.filterCloseData);
     ('The dialog was closed');
    //  this.animal = result;
    });
}


// getmyTicket(){
  
//   this.incidentservice.getMyTicket(this.openedby)
//   .subscribe(data => {
//     this.myTicketSort = data.rows;
//       this.myTicket = this.myTicketSort;
//       this.myTicketCount = data.rowCount;
//      ('my ticket '+(this.myTicket))
//       debugger;
//      ('openedbyempid',JSON.stringify(this.myTicket))
//   });

// }

// async applyFilterMyticket(filterValue: string) {
//   this.myTicket=this.myTicketSort;
//   if(filterValue === ''){
//       return this.getmyTicket();
//    }
//    this.myTicket=this.myTicket.filter((filteredData:any) =>
//     filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
//        filteredData.inid_id.includes(filterValue.toUpperCase().trim()));
    
// }

getassignedTicket(event:any){
  const data = event.target ? (event.target as HTMLInputElement).value : event;
  this.filterAssignData = data;

  if(this.filterAssignData === 'Last 24 hours'){
    this.filterAssignData = '1';
    this.incidentservice.getassignedTicket(this.ownedby,this.filterAssignData)
    .subscribe(data => {
      this.assigndeTicketSort = data.rows
        this.assignedTicket = this.assigndeTicketSort;
        this.assignedTicketCount = data.rowCount;
       ('my assignedticket'+JSON.stringify(this.assignedTicket))
    });
  }else if(this.filterAssignData === 'Last 7 days'){
    this.filterAssignData = '7';
    this.incidentservice.getassignedTicket(this.ownedby,this.filterAssignData)
    .subscribe(data => {
      this.assigndeTicketSort = data.rows
        this.assignedTicket = this.assigndeTicketSort;
        this.assignedTicketCount = data.rowCount;
       ('my assignedticket'+JSON.stringify(this.assignedTicket))
    });
  }else if(this.filterAssignData === 'Last 30 days'){
    this.filterAssignData = '30';
    this.incidentservice.getassignedTicket(this.ownedby,this.filterAssignData)
    .subscribe(data => {
      this.assigndeTicketSort = data.rows
        this.assignedTicket = this.assigndeTicketSort;
        this.assignedTicketCount = data.rowCount;
       ('my assignedticket'+JSON.stringify(this.assignedTicket))
    });
  }
  
 

}

async applyFilterAssigned(event: any) {
  const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
  this.assignedTicket=this.assigndeTicketSort;
  if(filterValue === ''){
      return this.getassignedTicket(this.filterAssignData);
   }
   this.assignedTicket=this.assignedTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) )
 
  (this.assignedTicket);
    
}

// getunassignedTicket(){
  
//   this.incidentservice.getunassignedTicket()
//   .subscribe(data => {
//     this.unassigndeTicketSort = data.rows;
//       this.unassignedTicket = this.unassigndeTicketSort;
//       this.unassignedTicketCount = data.rowCount;
//      ('my ticket'+this.unassignedTicketCount)
//   });

// }

// async applyFilterunAssigned(filterValue: string) {
//   this.unassignedTicket=this.unassigndeTicketSort;
//   if(filterValue === ''){
//       return this.getunassignedTicket();
//    }
//    this.unassignedTicket=this.unassignedTicket.filter((filteredData:any) =>
//     filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
//        filteredData.inid_id.includes(filterValue.toUpperCase().trim()))
 
//   (this.unassignedTicket);
    
// }

// getclosedTicket(){
  
//   this.incidentservice.getclosedTicket()
//   .subscribe(data => {
//     this.closedTicketSort = data.rows;
//       this.closedTicket =  this.closedTicketSort;
//       this.closedTicketCount = data.rowCount;
//      ('my ticket'+this.closedTicketCount)
//   });

// }


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
 this.filterCloseData = '40';
 this.incidentservice.getclosedTicketDays(this.filterCloseData)
 .subscribe(data => {
   this.closedTicketSort = data.rows;
     this.closedTicket =  this.closedTicketSort;
     this.closedTicketCount = data.rowCount;
    ('close ticket'+JSON.stringify(this.closedTicket))
 });    

}


}


async applyFilterClosed(event: Event) {
  const filterValue = (event.target as HTMLInputElement).value;
  this.closedTicket=this.closedTicketSort;
  if(filterValue === ''){
      return this.getclosedTicket(this.filterCloseData);
   }
   this.closedTicket=this.closedTicket.filter((filteredData:any) =>
    filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
       filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
       filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) )
 
  (this.closedTicket);
    
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
    (htol)
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
     (htol)
      this.myTicket=htol;
      
    }
 
   


 
}

sortAssignedTicket(event:any) {
  const option = event.target ? (event.target as HTMLInputElement).value : event;
  let htol=[];
  if(option ===  'New'){
   this.assignedTicket = this.assigndeTicketSort;
    for(let i=0;i<this.assignedTicket.length;i++){
        if(this.assignedTicket[i].status === 'New' && i!=this.assignedTicket.length){
            htol.push(this.assignedTicket[i])
        }
      }
      this.assignedTicket=htol;
      this.assignedTicketCount = this.assignedTicket.length;
  }
  if(option ===  'Assigned'){
   this.assignedTicket = this.assigndeTicketSort;
      for(let i=0;i<this.assignedTicket.length;i++){
        if(this.assignedTicket[i].status === 'Assigned' && i!=this.assignedTicket.length){
          htol.push(this.assignedTicket[i])
      }
    }
    this.assignedTicket=htol;
    this.assignedTicketCount = this.assignedTicket.length;
   }
   if(option ===  'In progress'){
     this.assignedTicket = this.assigndeTicketSort;
    for(let i=0;i<this.assignedTicket.length;i++){
      if(this.assignedTicket[i].status === 'In progress' && i!=this.assignedTicket.length){
        htol.push(this.assignedTicket[i])
    }
        
    
    }
   (htol)
    this.assignedTicket=htol;
    this.assignedTicketCount = this.assignedTicket.length;
   
  }

  if(option ===  'Pending customer'){
   this.assignedTicket = this.assigndeTicketSort;
     for(let i=0;i<this.assignedTicket.length;i++){
         if(this.assignedTicket[i].status === 'Pending customer' && i!=this.assignedTicket.length){
             htol.push(this.assignedTicket[i])
         }
       }
       this.assignedTicket=htol;
       this.assignedTicketCount = this.assignedTicket.length;
     }
     if(option ===  'Pending vendor'){
       this.assignedTicket = this.assigndeTicketSort;
       for(let i=0;i<this.assignedTicket.length;i++){
         if(this.assignedTicket[i].status === 'Pending vendor' && i!=this.assignedTicket.length){
           htol.push(this.assignedTicket[i])
       }
     }
     this.assignedTicket=htol;
     this.assignedTicketCount = this.assignedTicket.length;
   }
   if(option ===  'Resolved'){
     this.assignedTicket = this.assigndeTicketSort;
     for(let i=0;i<this.assignedTicket.length;i++){
       if(this.assignedTicket[i].status === 'Resolved' && i!=this.assignedTicket.length){
         htol.push(this.assignedTicket[i])
     }
         
     
     }
    (htol)
     this.assignedTicket=htol;
     this.assignedTicketCount = this.assignedTicket.length;
     
   }
   if(option ===  'Closed'){
     this.assignedTicket = this.assigndeTicketSort;
     for(let i=0;i<this.assignedTicket.length;i++){
       if(this.assignedTicket[i].status === 'Closed' && i!=this.assignedTicket.length){
         htol.push(this.assignedTicket[i])
     }
         
     
     }
    (htol)
     this.assignedTicket=htol;
     this.assignedTicketCount = this.assignedTicket.length;
   }

  
   

 
}


sortunAssignedTicket(option:string) {
 
  
   let htol=[];
   if(option ===  'High to Low'){
   
     for(let i=0;i<this.unassignedTicket.length;i++){
       debugger;
         if(this.unassignedTicket[i].priority === 'High' && i!=this.unassignedTicket.length){
             htol.push(this.unassignedTicket[i])
         }
       }
       for(let i=0;i<this.unassignedTicket.length;i++){
         if(this.unassignedTicket[i].priority === 'Medium' && i!=this.unassignedTicket.length){
           htol.push(this.unassignedTicket[i])
       }
     }
     for(let i=0;i<this.unassignedTicket.length;i++){
       if(this.unassignedTicket[i].priority === 'Low' && i!=this.unassignedTicket.length){
         htol.push(this.unassignedTicket[i])
     }
         
     
     }
    (htol)
     this.unassignedTicket=htol;
    
   }
 
   if(option ===  'Low to High'){
    
      for(let i=0;i<this.unassignedTicket.length;i++){
          if(this.unassignedTicket[i].priority === 'Low' && i!=this.unassignedTicket.length){
              htol.push(this.unassignedTicket[i])
          }
        }
        for(let i=0;i<this.unassignedTicket.length;i++){
          if(this.unassignedTicket[i].priority === 'Medium' && i!=this.unassignedTicket.length){
            htol.push(this.unassignedTicket[i])
        }
      }
      for(let i=0;i<this.unassignedTicket.length;i++){
        if(this.unassignedTicket[i].priority === 'High' && i!=this.unassignedTicket.length){
          htol.push(this.unassignedTicket[i])
      }
          
      
      }
     (htol)
      this.unassignedTicket=htol;
      
    }

 
}


sortClosedTicket(event:Event) {
  const option = (event.target as HTMLInputElement).value;
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





getItems(data:any){

  this.incidentservice.inid = data.inid_id;
 (this.incidentservice.inid)
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
     
      this.getassignedTicket(this.filterAssignData  );
      this.getclosedTicket(this.filterCloseData);
     ('The dialog was closed');
    //  this.animal = result;
    });
  }



  
}
