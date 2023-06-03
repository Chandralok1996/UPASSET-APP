import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

import { EndUserService } from '../../_services/end-user.service';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { NoopScrollStrategy } from '@angular/cdk/overlay';

import { AccountService } from 'src/app/_services/account.service';
import { IncidentService } from 'src/app/_services/incident.service';
import { UpdateTicketComponent } from 'src/app/update-ticket/update-ticket.component';
import { HostListener } from '@angular/core';
import { AlertService } from 'src/app/_services';
import { formatDate } from '@angular/common';


@Component({
  selector: 'app-end-user-land',
  templateUrl: './end-user-land.component.html',
  styleUrls: ['./end-user-land.component.css']
})
export class EndUserLandComponent implements OnInit {
  plus: boolean=false;
  public buttonName:any = 'Show';
  selected1=[ 
     
    'New',
    'Assigned',
    'In progress',
    'Pending customer',
    'Pending vendor',
    'Resolved',
    'Closed'
  ];
 sort=null;

  filterValue : any;

  loginform: FormGroup;
  display:any;
  
 
  

  searchedKeyword: string;
  openedby: any;
  myTicketSort: any;

  constructor(fb: FormBuilder,public enduserservice:EndUserService,
    public alterservices: AlertService,
    private formBuilder: FormBuilder,
    public accountService: AccountService,public router: Router,public dialog: MatDialog,
    public incidentservice: IncidentService,) {
    this.loginform = fb.group({
      dob: ["", Validators.required]
   });
     
} 
data1:any;
data2:any;
requests:any;
tokenName:any;
myTicketCount: any;
myTicket: any;
data3:any;


myticketData = 'Last 24 hours';
form: FormGroup;
loading = false;
submitted = false;
currentDate = new Date();
cValue = formatDate(this.currentDate, 'yyyy-MM-dd', 'en-US');



  ngOnInit(): void {

    this.tokenName=localStorage.getItem("LoggedInUser");
    this.openedby = this.accountService.user.userid;
    this.getmyTicket(this.myticketData);

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
    console.log(this.form.value)


    if(this.myticketData === 'Select date'){

      this.incidentservice.getmyTicketDate(this.openedby,this.form.value.startDate,this.form.value.endDate).subscribe(data => {
        this.myTicketSort = data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
       
      });
        
    }

  }

 

  getmyTicket(data){
    this.myticketData = data;

    if(this.myticketData === 'Last 24 hours'){
       this.myticketData = '1'
      this.incidentservice.getMyTicket(this.openedby,this.myticketData)
      .subscribe(data => {
        this.myTicketSort = data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicketCount)
      });

    }else  if(this.myticketData === 'Last 7 days'){
      this.myticketData = '7';
      this.incidentservice.getMyTicket(this.openedby,this.myticketData)
      .subscribe(data => {
        this.myTicketSort = data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicketCount)
      });

    }else  if(this.myticketData === 'Last 30 days'){
      this.myticketData = '30'
      this.incidentservice.getMyTicket(this.openedby,this.myticketData)
      .subscribe(data => {
        this.myTicketSort = data.rows;
          this.myTicket = this.myTicketSort;
          this.myTicketCount = data.rowCount;
          console.log('my ticket'+this.myTicketCount)
      });

    }
  
   
  
  }

  async applyFilterMyticket(filterValue: string) {
    this.myTicket=this.myTicketSort;
    if(filterValue === ''){
        return this.getmyTicket(this.myticketData);
     }
     this.myTicket=this.myTicket.filter(filteredData =>
      filteredData.openedbyempid.includes(filterValue.toUpperCase().trim()) ||
         filteredData.inid_id.includes(filterValue.toUpperCase().trim()) ||
         filteredData.openedby.toUpperCase().includes(filterValue.toUpperCase().trim()) )
   
     console.log(this.myTicket);
      
  }

 

 

  onCitySelect(option:string) {
   
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
      console.log(htol)
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
       console.log(htol)
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



 
 
  openDialog(): void {
    // const dialogRef = this.dialog.open(NewTicketComponent, {
    //   width: '653px',
    //   height: '500px',
    //   scrollStrategy: new NoopScrollStrategy(),
    //   disableClose:true,
    //   position: {top:'7.9%'}

    // });

    // dialogRef.afterClosed().subscribe(result => {
    //   this.getmyTicket();
    //   console.log('The dialog was closed');
    // //  this.animal = result;
    // });

    this.router.navigate(['/home/users/ticketcreationenduser']);


  }



  toggle2() {
    this.plus = !this.plus;
  
    // CHANGE THE NAME OF THE BUTTON.
    if(this.plus)  
      this.buttonName = "Hide";
    else
      this.buttonName = "Show";
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
        position: {top:'7.9%'},
       
    
      });
    
      dialogRef.afterClosed().subscribe(result => {
        console.log('The dialog was closed');
      //  this.animal = result;
      });
    }


openDialog1(): void {
  // const dialogRef = this.dialog.open(AtsendusersortComponent, {
  //   width: '653px',
  //   height: '500px',
  //   scrollStrategy: new NoopScrollStrategy(),
  //   disableClose:true,
  //   position: {top:'9%'}

  
    

  // });

  // dialogRef.afterClosed().subscribe(result => {
  //   console.log('The dialog was closed');
  // //  this.animal = result;
  // });


}


@HostListener('window:scroll', ['$event'])
onScroll(e) {
 // console.log('window', e);
}

 

divScroll(e) {
  //console.log('div App', e);
}

}
