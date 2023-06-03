import { SelectionModel } from '@angular/cdk/collections';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { IncidentService } from 'src/app/_services/incident.service';

@Component({
  selector: 'app-engineer-call',
  templateUrl: './engineer-call.component.html',
  styleUrls: ['./engineer-call.component.css']
})
export class EngineerCallComponent implements OnInit {

  excel: any;


  currentDate = new Date();

  year = this.currentDate.getFullYear();

  allUser: any[];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['engineer','count'];
  selection = new SelectionModel<any>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];


  constructor(public incidentservice: IncidentService,
    private router: Router,) { }

  ngOnInit(): void {
    this.engineerData();
  }


  engineerData(){
    this.incidentservice.engineerCount().subscribe(data => {
      this.tabledata = data.rows;
      console.log(this.tabledata)
      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
      //  this.dataSource.paginator = this.paginator; 
    });

  }

  detail(user_id){
    console.log(user_id)
    this.router.navigate(['/home/users/engineerdetail',user_id])
   }

   applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  
}
