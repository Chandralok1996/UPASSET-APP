import { SelectionModel } from '@angular/cdk/collections';
import { NoopScrollStrategy } from '@angular/cdk/overlay';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { ValidatorComponent } from 'src/app/Validation/validator/validator.component';
import { assetlist } from 'src/app/_models/asset';
import { AccountService } from 'src/app/_services/account.service';
import { AssetService } from 'src/app/_services/asset.service';
import { IncidentService } from 'src/app/_services/incident.service';
import { InactiveFormComponent } from '../inactive-form/inactive-form.component';
import { RejoinFormComponent } from '../rejoin-form/rejoin-form.component';

@Component({
  selector: 'app-userpdp',
  templateUrl: './userpdp.component.html',
  styleUrls: ['./userpdp.component.css']
})
export class UserpdpComponent implements OnInit {

  allUser!: assetlist[];
  dataSource!: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  displayedColumns: string[] = ['select','first_name','assetno','astg_group', 'serialno','status'];

  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  details: any;
  assetid:any;
  myTicketSort: any;
  myTicket: any;
  openedby: any;

  type: any;
  options: any;

  selected1=[ 
    
    'High to Very High',
    
    
    'Very High to High'
  ];

  inactive:any;
  rejoin:any;

  defaultpath='../../assets/img/';
file: any;
file1:any;

  constructor(  public assetservice: AssetService,
    public route:ActivatedRoute,
    public accountservice: AccountService, 
    public dialog: MatDialog,
    private router: Router,
    public incidentservice: IncidentService,
     ) { }

  ngOnInit(): void {

   
    this.route.paramMap.subscribe((params) => {
       this.assetid = params.get('id');
       this.inactive = params.get('inactive');
       this.rejoin = params.get('rejoin');

       console.log('a'+ this.inactive +  this.rejoin)
      this.getbyassetdetails1(this.assetid)
      console.log(this.assetid)
      //.then().catch(err => console.log(err));
    });

    this.assetservice.assetforperticularuser(this.assetid).subscribe(data => {
      
      this.tabledata = data.rows;
      this.dataSource = new MatTableDataSource( this.tabledata );
      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 

    });


    
  }

  start(){

  
    this.file1=this.defaultpath+this.file;
   if(!this.file1){
    this.file1 = false;
   }
    console.log('stats',this.file1);
  }

  setDefaultPic(){
    this.file1 = 'assets/img/Trial 2.png';
  }

  getbyassetdetails1(assetid:any){
    this.accountservice.getbyuser(assetid)
        .subscribe(details => {
            this.details = details.rows;
            console.log(details.rows)
            this.openedby = this.details[0].user_id;
             this.file = this.details[0].firstname+'.jpg';
             console.log(this.file)
            this.getmyTicket();

           
              this.start();
            

        });

  }
  
  getmyTicket(){
    console.log(this.openedby)
    this.incidentservice.getMyTicket(this.openedby,1000)
    .subscribe(data => {
      this.myTicketSort = data.rows;
        this.myTicket = this.myTicketSort;
        this.myTicketSort = data.rowCount;
        console.log('my ticket'+this.myTicket)
    });
  
  }

  async applyFilterMyticket(event: any) {
    const filterValue = event.target ? (event.target as HTMLInputElement).value : event;
    this.myTicket=this.myTicketSort;
    if(filterValue === ''){
        return this.getmyTicket();
     }
     this.myTicket=this.myTicket.filter((filteredData:any) =>
         filteredData.inid_id.includes(filterValue.toUpperCase().trim()))
   
     console.log(this.myTicket);
      
  }
  getItems(ticket:any){

  }

  sortMyTicket(event:any) {
    const option = event.target ? (event.target as HTMLInputElement).value : event;
    if(option ===  'High to Very High'){
    this.myTicket=  this.myTicket.sort((a:any, b:any) => (a.priority > b.priority) ? 1 : -1)
    }
  
    if(option ===  'Very High to High'){
     this.myTicket=  this.myTicket.sort((a:any, b:any) => (b.priority > a.priority) ? 1 : -1)
     }
   
  }


  onRowClicked(row: any) {
    console.log('Row clicked: ', row);
  }

  isAllSelected() {
    const numSelected = this.selection.selected.length;
    const numRows = this.dataSource.data.length;
    return numSelected === numRows;
  }

  masterToggle() {
    this.isAllSelected() ?
      this.selection.clear() :
      this.dataSource.data.forEach(row => this.selection.select(row));
  }

  openDialog(): void {
    console.log(this.details[0].user_id);
    this.accountservice.empid1 = this.details[0].empid;
    this.accountservice.user_id1 = this.details[0].user_id;
    const dialogRef = this.dialog.open(ValidatorComponent, {
      width: '500px',
      height: '400px',
      scrollStrategy: new NoopScrollStrategy(),
      disableClose:true,
      panelClass: 'my-dialog',
      position: {top:'7.6%'}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    //  this.animal = result;
    });
  }
  
  routeHome(){
    this.router.navigate(['home/users/userlist']);
  }

  openInactive() : void{
    this.accountservice.user_id = this.assetid;
    this.router.navigate(['home/users/inactive', this.accountservice.user_id]);
  }


  openRejoin(): void{
    this.accountservice.user_id = this.assetid;
    this.router.navigate(['/home/users/rejoin', this.accountservice.user_id ])
  }

}
