import { SelectionModel } from '@angular/cdk/collections';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { IncidentService } from 'src/app/_services/incident.service';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-pending-status',
  templateUrl: './pending-status.component.html',
  styleUrls: ['./pending-status.component.css']
})
export class PendingStatusComponent implements OnInit {
  excel: any;

  currentDate = new Date();

  currentYearString = this.currentDate.getFullYear();

  allUser: any[];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['problem','ticket_no','emp_name','support_group','log_time','engineer','priority','callmode'];


  selection = new SelectionModel<any>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];


  constructor(private route:ActivatedRoute,
    public incidentservice: IncidentService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('status');
      this.getbydetails1(assetid)
      console.log(assetid)
      //.then().catch(err => console.log(err));
    });

  }

  getbydetails1(data){
    this.incidentservice.getCalPendningDetail(data,this.currentYearString)
    .subscribe(data => {
       
    this.tabledata = data.rows;
    console.log(this.tabledata);
    this.excel =  this.tabledata;
    this.dataSource = new MatTableDataSource( this.tabledata );
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;      
       
    })

  }

  
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  exportAsXLSX(){
    // console.log('llll',this.data1);
    var ws = XLSX.utils.json_to_sheet(this.excel);          
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "data");            
    XLSX.writeFile(wb, "REPORT.xlsx");       
        }
  

}
