import { SelectionModel } from '@angular/cdk/collections';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { IncidentService } from 'src/app/_services/incident.service';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-engineer-details',
  templateUrl: './engineer-details.component.html',
  styleUrls: ['./engineer-details.component.css']
})
export class EngineerDetailsComponent implements OnInit {
 
  allUser: any[];
  dataSource: MatTableDataSource<any>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['ticket_no','problem','employee_name','support_group','engineer','call_status','priority'];

  selection = new SelectionModel<any>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  excel: any;

  constructor(private route:ActivatedRoute,
    private incidentservice: IncidentService) { }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      var key = params.get('id');
     
      this.getengineerResult(key);
   });
  }

  
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }


  getengineerResult(key){
    this.incidentservice.getengineerDetail(key)
    .subscribe(data => {
       
    this.tabledata = data.rows;
    console.log(this.tabledata)
    this.excel =  this.tabledata;

    this.dataSource = new MatTableDataSource( this.tabledata );

    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;      
       
    })
  }

  exportAsXLSX(){
    // console.log('llll',this.data1);
    var ws = XLSX.utils.json_to_sheet(this.excel);          
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "data");            
    XLSX.writeFile(wb, "REPORT.xlsx");       
        }

}
