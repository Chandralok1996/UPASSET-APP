import { SelectionModel } from '@angular/cdk/collections';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { assetlist } from 'src/app/_models/asset';
import { AlertService } from 'src/app/_services';
import { AssetService } from 'src/app/_services/asset.service';
import { IncidentService } from 'src/app/_services/incident.service';
import * as XLSX from 'xlsx';

@Component({
  selector: 'app-report-data',
  templateUrl: './report-data.component.html',
  styleUrls: ['./report-data.component.css']
})
export class ReportDataComponent implements OnInit {

  allUser: assetlist[];
  dataSource: MatTableDataSource<assetlist>;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  displayedColumns: string[] = ['employee_name','asset_number','asset_group','laptop_desktop_serialno','monitor_serialno','accessory_serialno','server_serialno','asset_status'];

  selection = new SelectionModel<assetlist>(true, []);
  tabledata: any;
  value: any;
  length = 32;
  pageSize = 8;
  pageSizeOptions: number[] = [8, 16, 24, 32];
  filesToUpload: Array<File> = [];
  excel: any;


  constructor(public fb: FormBuilder,
     public assetservice: AssetService, 
    public router: Router,
    public dialog: MatDialog,
    public alterservices: AlertService,
        private http: HttpClient,
        public incidentservice: IncidentService,) {

   
  }

  ngOnInit(): void {
   
console.log(this.assetservice.enduser);
    this.assetservice.reportData(this.assetservice.enduser).subscribe(data => {
      this.tabledata = data.rows;
      console.log(this.tabledata)
      this.excel =  this.tabledata;

      this.dataSource = new MatTableDataSource( this.tabledata );

      this.dataSource.sort = this.sort;
      this.dataSource.paginator = this.paginator; 
     
    });
  }

  // exportAsXLSX(): void {
  //   this.incidentservice.exportAsExcelFile(this.excel, 'sample');
  // }

  exportAsXLSX(){
    // console.log('llll',this.data1);
    var ws = XLSX.utils.json_to_sheet(this.excel);
         
           
    var wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "data");
            
            
    XLSX.writeFile(wb, "REPORT.xlsx");
         
         
        }

  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
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

  

}
