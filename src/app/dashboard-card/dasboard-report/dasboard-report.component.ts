
import { SelectionModel } from '@angular/cdk/collections';

import { NoopScrollStrategy } from '@angular/cdk/overlay';


import { FormBuilder } from '@angular/forms';

import { MatDialog } from '@angular/material/dialog';

import { MatPaginator } from '@angular/material/paginator';

import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { AssetSortComponent } from 'src/app/Asset-Report/asset-sort/asset-sort.component';
import { AttachmentComponent } from 'src/app/attachment/attachment.component';
import { assetdata } from 'src/app/_models/asset';
import { AlertService } from 'src/app/_services';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AssetService } from 'src/app/_services/asset.service';
import * as XLSX from 'xlsx';
import { count } from 'console';

const FileSaver = require('file-saver');
@Component({
  selector: 'app-dasboard-report',
  templateUrl: './dasboard-report.component.html',
  styleUrls: ['./dasboard-report.component.css']
})
export class DasboardReportComponent implements OnInit {
  devicelist: any;
  allasset:assetdata[];
  fileName:'ExcelSheet.xlsx';
  excel:any;
  length = 32;
devicename:any;
showdesktable:boolean=false;

dataSource: MatTableDataSource<assetdata>;

@ViewChild(MatSort, { static: true }) sort: MatSort;
@ViewChild(MatPaginator) paginator: MatPaginator;
@ViewChild('TABLE') table: ElementRef;
displayedColumns: string[] = ['select','assetname','assetid','owner_name','quantity', 'custodian','class','make','serialno','model','hostname'];
selection = new SelectionModel<assetdata>(true, []);
tabledata: any;
value: any;
pageSize = 8;

pageSizeOptions: number[] = [8, 16, 24, 32];
  produts: any;
  catname: string;
  datacount: any;
  showittable: boolean=false;
  electable: boolean=false;
  bmstable: boolean=false;
  constructor(private assetservice:AssetService, private route:ActivatedRoute,private router: Router) { }
 

  ngOnInit(): void {

    this.route.paramMap.subscribe((params) => {
      const assetid = params.get('id');
      this.catname=assetid;
    console.log(assetid);
    if(assetid=="Device")
    {

        this.assetservice.devicelist().subscribe(data => {
      
         this.tabledata=data.rows;
         this.datacount=this.tabledata.length;
         console.log(this.datacount);
       //  this.excel=data.rows;
       this.dataSource = new MatTableDataSource( this.tabledata );
       this.dataSource.sort = this.sort;
       this.dataSource.paginator = this.paginator; 
         
         this.showdeskdata();
        });
      
    }
    else if(assetid=="IT RACK")
    {
      this.assetservice.ITracklistser().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;

        this.dataSource = new MatTableDataSource( this.tabledata );
       this.dataSource.sort = this.sort;
       this.dataSource.paginator = this.paginator; 
       this.showitrackdata();
        
      });
    }
    else if(assetid=="BMS")
    {
      this.assetservice.getbms().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;

        this.dataSource = new MatTableDataSource( this.tabledata );
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator; 
        this.showbmsdata();
      });
    }
    else if(assetid=="ELECTRICAL")
    {
      this.assetservice.getelectrical().subscribe(data => {
        this.tabledata=data.rows;
        this.datacount=this.tabledata.length;

        this.dataSource = new MatTableDataSource( this.tabledata );
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator; 
        this.showelecdata();
      });
    }
    else{
      console.log("wrong id");
    }
    
    })
    this.exportexcel()
  }
  applyFilter(filterValue:String) {
    console.log(filterValue);
    this.tabledata.filter = filterValue.trim().toLowerCase();
    console.log(this.tabledata);
  }


  exportexcel(): void
    {
      /* pass here the table id */
      let element = document.getElementById('excel-table');
      const ws: XLSX.WorkSheet =XLSX.utils.table_to_sheet(element);
   console.log(ws);
      /* generate workbook and add the worksheet */
      const wb: XLSX.WorkBook = XLSX.utils.book_new();
      console.log(wb);
      XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
   
      /* save to file */  
      XLSX.writeFile(wb, this.fileName);
   
    }


  // downloadPdf() {
  //   // const pdfUrl = './assets/attachment_files/tamplate/item_bulkload_template.xlsx';
  //   // const pdfName = 'item_bulkload_template.xlsx';
  //   // FileSaver.saveAs(pdfUrl, pdfName);
  //   // var ws = XLSX.utils.json_to_sheet(this.excel);          

  //   // var wb = XLSX.utils.book_new();

  //   // XLSX.utils.book_append_sheet(wb, ws, "data");            

  //   // XLSX.writeFile(wb, "REPORT.xlsx");   
  // }
  // ExportTOExcel()
  // {
  //   const ws: XLSX.WorkSheet=XLSX.utils.table_to_sheet(this.table.nativeElement);
  //   const wb: XLSX.WorkBook = XLSX.utils.book_new();
  //   XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
    
  //   /* save to file */
  //   XLSX.writeFile(wb, 'SheetJS.xlsx');
    
  // }

  download(): void {

    let wb = XLSX.utils.table_to_book(document.getElementById('excel-table'), { display: false, raw: true });

    XLSX.writeFile(wb, "invoiceReport.xlsx");

  }

  showdeskdata()
  {
    this.showdesktable=true;
  }
  showitrackdata()
  {
    this.showittable=true;
  }
  showelecdata()
  {
    this.electable=true;
  }
  showbmsdata()
  {
    this.bmstable=true;
  }
}

